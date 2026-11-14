async function runTests(script,html){
 const asserts=[];
 const ok=(name,value)=>{asserts.push({name,passed:!!value});if(!value)throw new Error("FALLÓ: "+name)};
 const ids=[...html.matchAll(/\bid="([^"]+)"/g)].map(m=>m[1]);
 const selects=new Set([...html.matchAll(/<select[^>]*id="([^"]+)"/g)].map(m=>m[1]));
 const filterIds=[...html.matchAll(/<(?:input|select)[^>]*data-filter[^>]*id="([^"]+)"/g)].map(m=>m[1]);
 class Node{
  constructor(tag,value=""){this.tagName=tag.toUpperCase();this.parts=[];this.raw=String(value);this.dataset={};this.style={};this.events={};this.attrs={};this.value="";this.checked=false;this.disabled=false;this.hidden=false;this.open=false}
  get children(){return this.parts}get lastElementChild(){return this.parts.at(-1)||null}
  get textContent(){return this.raw+this.parts.map(p=>p.textContent).join("")}
  set textContent(x){this.raw=String(x);this.parts=[]}
  append(...xs){for(const x of xs)if(x!=null)this.parts.push(...(x.tagName==="#FRAGMENT"?x.parts:[x]))}
  prepend(...xs){this.parts.unshift(...xs)}
  replaceChildren(...xs){this.raw="";this.parts=[];this.append(...xs)}
  setAttribute(k,v){this.attrs[k]=String(v)}
  addEventListener(k,fn){this.events[k]=fn}
  scrollIntoView(){}
 }
 function environment(){
  const nodes=new Map(ids.map(id=>[id,new Node(selects.has(id)?"select":"input")]));
  const doc={getElementById:id=>nodes.get(id),createElement:tag=>new Node(tag),createTextNode:value=>new Node("#text",value),createDocumentFragment:()=>new Node("#fragment"),querySelectorAll:k=>k==="[data-filter]"?filterIds.map(id=>nodes.get(id)):[]};
  const URLClass=class{constructor(){this.searchParams={get:()=>null}}};
  return {nodes,doc,URLClass};
 }
 const fac=(name,value,extra={})=>({nombre:name,version_formula:"IA-normalizacion-1.0",valor:{valor_normalizado:{tipo:"texto",valor:value,...extra},evidencias:[{url_original:"https://example.org/archivo.pdf",numero_pagina:2}]}});
 const cv=(number,title,faculty,extra={})=>({numero:number,validada:false,estado_validacion:"pendiente",fuentes_originales:[{fuente_id:1,tipo:"excel",url_original:"https://example.org/fuente"}],datos_originales:[{rotulo_literal:"Nombre de la convocatoria",literal_completo:title,fuente_id:1},{rotulo_literal:"Facultad",literal_completo:faculty,fuente_id:1}],listas_originales:[],resultados_estructurados:[],indicadores_sinteticos:[],control_validacion:{puertas:[]},...extra});
 const convocatorias=[
  cv("2026-C2381","Apoyo Química","Ciencias",{indicadores_sinteticos:[fac("evaluacion.criterio.1","Entrevista 40%"),fac("evaluacion.criterio.2","Hoja de vida 60%"),fac("perfil.papa_minimo","PAPA ≥ 4.0")]}),
  cv("2026-C2374","Investigación","Ingeniería",{indicadores_sinteticos:[fac("perfil.avance_plan_estudios",null,{tipo:"porcentaje_de_avance",minimo_pct:60,minimo_inclusivo:true,filtro_habilitado:true})]}),
  cv("2026-C2188","Bienestar","Bienestar",{resultados_estructurados:[{fila_original:1,fuente_id:1,tabla_id:1,identificacion_literal:"identificador de prueba",nombre_literal:null,valores:[{encabezado_literal:"Entrevista",valor_literal:"30"}],observacion_literal:null}]})
 ];
 const data={version_contrato:"3.0",metricas:{convocatorias_identificadas:3,convocatorias_validadas:0},convocatorias};
 const env=environment();
 new Function("document","fetch","location","URL",script)(env.doc,async()=>({ok:true,json:async()=>data}),{href:"https://example.org/"},env.URLClass);
 for(let i=0;i<25;i++)await Promise.resolve();
 const $=id=>env.nodes.get(id);
 ok("contrato V3 cargado", $("metric-total").textContent==="3");
 ok("diez apartados", ["Identificación general","Perfil y requisitos","Actividades a desarrollar","Condiciones de vinculación","Postulación y documentación","Proceso de selección","Criterios de evaluación y ponderaciones","Resultados de selección","Responsables y certificaciones","Fuentes y trazabilidad"].every(s=>$("mainview").textContent.includes(s)));
 ok("valores reales del modelo", $("mainview").textContent.includes("Apoyo Química"));
 ok("criterios con porcentaje", $("mainview").textContent.includes("Entrevista"));
 ok("resultados estructurados vacíos visibles", $("mainview").textContent.includes("Sin filas de participantes estructuradas"));
 $("schemaToggle").events.click();
 ok("modo de estructura vacía", $("mainview").textContent.includes("Vista del esquema completo"));
 $("schemaToggle").events.click();
 ok("regreso a convocatoria", $("mainview").textContent.includes("Apoyo Química"));
 function filter(id,val){$(id).value=val;$(id).events[selects.has(id)?"change":"input"]()}
 filter("criterionText","Entrevista");
 ok("filtro por criterio", $("filtered-count").textContent==="1 de 3");
 filter("criterionText","");filter("participantsMin","1");
 ok("filtro por participantes", $("filtered-count").textContent==="1 de 3");
 filter("participantsMin","99");
 ok("sin coincidencias mantiene estructura", $("mainview").textContent.includes("Ficha completa de convocatoria"));
 filter("participantsMin","");filter("advanceMin","50");
 ok("filtro de avance inequívoco", $("filtered-count").textContent==="1 de 3");
 filter("advanceMin","");filter("papaMin","4");
 ok("filtro PAPA", $("filtered-count").textContent==="1 de 3");
 filter("papaMin","");
 const find=(root,predicate)=>{const out=[];function walk(x){if(predicate(x))out.push(x);for(const y of x.parts||[])walk(y)}walk(root);return out};
 let checks=find($("case-list"),x=>x.tagName==="INPUT"&&x.type==="checkbox");
 ok("casillas de comparación",checks.length===3);
 checks[0].checked=true;checks[0].events.change();
 checks=find($("case-list"),x=>x.tagName==="INPUT"&&x.type==="checkbox");
 checks[1].checked=true;checks[1].events.change();
 ok("comparación disponible", $("compare").disabled===false);
 $("compare").events.click();
 ok("comparación lado a lado", $("mainview").textContent.includes("2 convocatorias lado a lado"));
 $("show-detail").events.click();
 ok("regreso desde comparación", $("mainview").textContent.includes("Identificación general"));
 const failed=environment();
 new Function("document","fetch","location","URL",script)(failed.doc,async()=>{throw new Error("sin conexión")},{href:"https://example.org/"},failed.URLClass);
 for(let i=0;i<25;i++)await Promise.resolve();
 ok("error no elimina estructura",failed.nodes.get("mainview").textContent.includes("Fuentes y trazabilidad")&&failed.nodes.get("mainview").textContent.includes("Sin dato"));
 ok("error identificado",failed.nodes.get("filter-summary").textContent.includes("sin conexión"));
 return asserts;
}
if(typeof require==="function"&&typeof module!=="undefined"&&require.main===module){
 const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
 runTests(fs.readFileSync(path.join(root,"assets/visor-ideal-v3.js"),"utf8"),fs.readFileSync(path.join(root,"index.html"),"utf8"))
 .then(t=>{console.log(t.length+" pruebas de interfaz superadas")}).catch(e=>{console.error(e);process.exitCode=1});
}