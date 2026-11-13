#!/usr/bin/env python3
"""Control V3 de un MANIFIESTO producido por IA, nunca extracción de PDF.

Valida disciplina de trabajo, límites y rutas de evidencia. No certifica
contenido visual ni genera actas. La validez solo la calcula SQLite V3.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
CONF=ROOT/"config"/"contrato_ia_v3.json"

class EntregaInvalida(ValueError): pass

def exigir(cond,msg):
    if not cond:raise EntregaInvalida(msg)

def url(v):
    return isinstance(v,str) and v.startswith(("https://","http://")) and len(v)>12

def revisar(manifest,config,anteriores=None):
    anteriores=anteriores or []
    exigir(manifest.get("version_contrato")==config["version_contrato"],"Versión de contrato inválida")
    exigir(isinstance(manifest.get("lote_id"),str) and manifest["lote_id"].strip(),"Falta lote_id")
    exigir(isinstance(manifest.get("fecha_corte"),str) and len(manifest["fecha_corte"])>=10,
           "Falta fecha_corte verificable")
    cases=manifest.get("convocatorias")
    maximo=config["maximo_convocatorias_distintas_por_interaccion"]
    exigir(isinstance(cases,list) and 0<len(cases)<=maximo,
           f"Solo se admiten entre 1 y {maximo} convocatorias distintas")
    codes=[case.get("numero") for case in cases]
    exigir(all(isinstance(c,str) and c.strip() for c in codes),"Código de convocatoria vacío")
    exigir(len(set(codes))==len(codes),"Convocatoria duplicada; agrupar las filas por código")

    def extraidas(data):
        seen=set()
        for case in data.get("convocatorias",[]):
            for action in case.get("lecturas",[]):
                if action.get("accion")=="extraer":
                    sources=[src for src in case.get("fuentes",[])
                             if src.get("tipo")==action.get("fuente_tipo")
                             and src.get("version_fuente")==action.get("version_fuente")
                             and (not action.get("fuente_url")
                                  or src.get("url_original")==action.get("fuente_url"))]
                    if len(sources)==1:
                        seen.add((sources[0].get("url_original"),action.get("version_fuente"),
                                  action.get("ubicacion")))
        return seen
    leidas=set()
    anteriores_leidas=set().union(*(extraidas(a) for a in anteriores))
    unresolved=0
    total_read=0
    for i,case in enumerate(cases,1):
        code=case["numero"]
        exigir(case.get("orden")==i,f"{code}: orden incorrecto; se esperaba {i}")
        exigir(case.get("estado_cierre") in config["estados_cierre_manifesto"],
               f"{code}: el manifiesto no puede declarar una convocatoria validada")
        fuentes=case.get("fuentes")
        exigir(isinstance(fuentes,list) and fuentes,f"{code}: falta inventario de fuentes")
        exigir(any(s.get("tipo")=="excel" for s in fuentes),f"{code}: falta fuente Excel")
        lookup={}
        seenSources=set()
        for src in fuentes:
            t=src.get("tipo")
            exigir(t in config["tipos_fuente"],f"{code}: tipo de fuente no reconocido")
            u=src.get("url_original")
            state=src.get("estado")
            version=src.get("version_fuente")
            exigir(state in config["estados_fuente"],f"{code}: estado de fuente incorrecto")
            exigir(isinstance(version,str) and version.strip(),f"{code}: fuente sin versión")
            if not url(u):
                exigir(state in ("pendiente","fallo_acceso")
                       and isinstance(src.get("incidencia"),str) and len(src["incidencia"])>=12,
                       f"{code}: fuente sin URL y sin incidencia expresa")
                unresolved+=1
            identity=(t,u,version)
            exigir(identity not in seenSources,f"{code}: inventario de fuentes duplicado")
            seenSources.add(identity)
            lookup.setdefault(t,[]).append(src)
        status=case.get("consulta_resultados")
        exigir(isinstance(status,dict),f"{code}: falta comprobación/estado explícito de resultados")
        st=status.get("estado")
        exigir(st in config["estados_resultados"],f"{code}: estado de resultados incorrecto")
        if st!="indeterminado":
            exigir(url(status.get("url_sitio_consultado"))
                   and isinstance(status.get("fecha_consulta"),str)
                   and len(status["fecha_consulta"])>=10
                   and isinstance(status.get("alcance_y_metodo"),str)
                   and len(status["alcance_y_metodo"])>=16,
                   f"{code}: comprobación de resultados sin URL, fecha o alcance")
        if st=="pdf_encontrado":
            exigir(any(s["tipo"]=="resultados_pdf" and url(s.get("url_original"))
                       for s in fuentes),
                   f"{code}: se encontró PDF resultados pero no se registró su enlace")
        if st=="sin_pdf_verificado_al_corte":
            exigir(not any(s["tipo"]=="resultados_pdf" and url(s.get("url_original"))
                           for s in fuentes),
                   f"{code}: imposible declarar ausencia si hay PDF resultados identificado")
        for row in case.get("lecturas",[]):
            total_read+=1
            t=row.get("fuente_tipo")
            exigir(t in lookup,f"{code}: lectura sin fuente inventariada")
            compatibles=[src for src in lookup[t]
                        if src.get("version_fuente")==row.get("version_fuente")
                        and (not row.get("fuente_url")
                             or src.get("url_original")==row.get("fuente_url"))]
            exigir(len(compatibles)==1,
                   f"{code}: lectura ambigua; declarar fuente_url si hay fuentes del mismo tipo/versión")
            source=compatibles[0]
            exigir(url(source.get("url_original")),
                   f"{code}: no se puede afirmar lectura de fuente sin URL")
            assert_version=source["version_fuente"]
            location=row.get("ubicacion")
            exigir(isinstance(location,str) and location.strip(),f"{code}: lectura sin ubicación")
            action=row.get("accion")
            exigir(action in config["acciones_lectura"],f"{code}: acción de lectura desconocida")
            source_url=source.get("url_original")
            identity=(source_url,assert_version,location)
            if action=="extraer":
                exigir(identity not in leidas and identity not in anteriores_leidas,
                       f"{code}: lectura ya realizada (fuente+versión+ubicación) {identity}")
                leidas.add(identity)
            if action=="reextraer_justificado":
                exigir(isinstance(row.get("motivo"),str) and len(row["motivo"])>=10
                    and isinstance(row.get("nueva_version_lectura"),str)
                    and row["nueva_version_lectura"].strip(),
                    f"{code}: reextracción sin justificación y versión")
        for item in case.get("cobertura",[]):
            tipo=item.get("fuente_tipo")
            exigir(tipo in lookup,f"{code}: cobertura sin fuente")
            matches=[src for src in lookup[tipo]
                     if not item.get("fuente_url") or src.get("url_original")==item["fuente_url"]]
            exigir(len(matches)==1,f"{code}: cobertura ambigua; indicar fuente_url")
            e=item.get("total_observado")
            c=item.get("total_cotejado")
            exigir(isinstance(e,int) and not isinstance(e,bool) and e>=0
                   and isinstance(c,int) and not isinstance(c,bool) and 0<=c<=e,
                   f"{code}: cobertura inválida, negativa o superior al total observado")
        exigir(isinstance(case.get("incidencias"),list),f"{code}: falta lista explícita de incidencias")
    return {
      "resultado":"consistencia_del_manifiesto_confirmada",
      "NO_equivale_a_validacion_documental":True,
      "convocatorias_en_solicitud":len(cases),
      "maximo":maximo,"lecturas_registradas":total_read,
      "fuentes_con_enlace_pendiente":unresolved
    }

def cargar(path):return json.loads(Path(path).read_text(encoding="utf-8"))

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("manifiesto",type=Path)
    p.add_argument("--anteriores",nargs="*",default=[],type=Path)
    a=p.parse_args()
    try:
        result=revisar(cargar(a.manifiesto),cargar(CONF),
                       [cargar(x) for x in a.anteriores])
    except (EntregaInvalida,KeyError,TypeError,ValueError) as error:
        p.exit(1, "CONTROL V3 RECHAZADO: "+str(error)+"\n")
    print(json.dumps(result,ensure_ascii=False,indent=2))
