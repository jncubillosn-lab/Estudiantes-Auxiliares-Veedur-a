"use strict";
(()=>{
const DATA_URL="./data/expedientes_v3.json";
const $=id=>document.getElementById(id);
const el=(tag,cls,txt)=>{const n=document.createElement(tag);if(cls)n.className=cls;if(txt!==undefined&&txt!==null)n.textContent=String(txt);return n;};
const arr=x=>Array.isArray(x)?x:[];
const present=x=>x!==undefined&&x!==null&&String(x).trim()!=="";
const norm=x=>String(x??"").normalize("NFD").replace(/[\u0300-\u036f]/g,"").toLowerCase().replace(/\s+/g," ").trim();
const safeURL=x=>typeof x==="string"&&/^https?:\/\/\S+$/i.test(x);
const blank=()=>el("span","missing","Sin dato");
const numberFmt=n=>new Intl.NumberFormat("es-CO",{maximumFractionDigits:2}).format(n);
const money=n=>new Intl.NumberFormat("es-CO",{style:"currency",currency:"COP",maximumFractionDigits:0}).format(n);
const config={
 title:{raw:["nombre de la convocatoria","nombre de la convocatoria, proyecto o proceso","titulo"]},
 faculty:{raw:["facultad","facultad, dependencia o proyecto que convoca"]},
 dependency:{raw:["nombre facultad, dependencia o proyecto que convoca","facultad, dependencia o proyecto"]},
 program:{raw:["programa curricular","carrera","programa academico"]},
 level:{raw:["tipo de convocatoria","tipo de estudiante"]},
 state:{raw:["estado de la convocatoria","estado"]},
 publish:{raw:["fecha de publicacion","fecha de publicacion de la convocatoria"]},
 close:{raw:["fecha de cierre de la convocatoria","fecha y hora de cierre de la convocatoria"]},
 closePDF:{facet:["aplicacion.fecha_cierre"]},
 activityType:{facet:["oferta.tipo_actividad"],raw:["tipo de actividades a desarrollar en la convocatoria"]},
 places:{raw:["no. de estudiantes a vincular","no de estudiantes a vincular","numero de estudiantes a vincular","n.º de estudiantes a vincular","plazas"],facet:["oferta.plazas"]},
 profile:{raw:["perfil requerido"],facet:["perfil.descripcion"]},
 profession:{facet:["perfil.titulo_pregrado_requerido"]},
 study:{facet:["perfil.posgrado_actual"]},
 seedbed:{facet:["perfil.pertenencia_semillero"]},
 advance:{raw:["porcentaje de avance","avance minimo","avance de la carrera"],facet:["perfil.avance_plan_estudios"]},
 papa:{facet:["perfil.papa_minimo"]},
 academicStatus:{raw:["vinculacion academica"]},
 experience:{raw:["experiencia requerida"]},
 knowledge:{facet:["perfil.competencia."]},
 exceptions:{raw:["excepciones","paragrafos"]},
 hours:{raw:["disponibilidad de tiempo requerida","horas semanales"],facet:["oferta.carga_horaria"]},
 modality:{raw:["modalidad de las actividades"],facet:["oferta.modalidad"]},
 stipend:{raw:["estimulo economico mensual","estimulo economico"],facet:["oferta.estimulo_mensual"]},
 periodicity:{raw:["periodicidad del estimulo"]},
 duration:{raw:["duracion de la vinculacion"],facet:["oferta.duracion"]},
 contract:{raw:["naturaleza de la vinculacion"]},
 conditions:{raw:["condiciones de la vinculacion","condiciones particulares"]},
 submission:{raw:["terminos para la presentacion de documentos"],facet:["aplicacion.envio_documentos"]},
 activities:{raw:["actividades a desarrollar"],facet:["oferta.actividad."]},
 requiredDocs:{raw:["documentacion requerida"]},
 criteria:{raw:["criterios de evaluacion","criterios de seleccion"]},
 channel:{raw:["medio de postulacion"]},
 format:{raw:["formato de entrega","formato de los documentos"]},
 applicationRules:{raw:["instrucciones de envio"]},
 optionalDocs:{raw:["documentos opcionales"]},
 restrictions:{raw:["restricciones"]},
 selection:{raw:["forma de seleccion"],facet:["evaluacion.metodo"]},
 enableCheck:{raw:["verificacion de requisitos"]},
 elimination:{raw:["condiciones eliminatorias"]},
 scoreSystem:{raw:["sistema de calificacion"]},
 maxScore:{raw:["puntaje maximo"]},
 tie:{raw:["criterios de desempate","reglas de desempate"]},
 eligibility:{raw:["lista de elegibles","condiciones de elegibilidad"]},
 responsible:{raw:["responsable de la convocatoria"],facet:["contacto.responsable"]},
 email:{raw:["correo del responsable"]},
 phone:{raw:["telefono del responsable","extension del responsable"]},
 resultDeadline:{raw:["fecha limite de publicacion de resultados"],facet:["resultados.fecha_limite_publicacion"]},
 resultEffective:{raw:["fecha de publicacion de resultados"]},
 resultReason:{raw:["motivo de no seleccion"]},
 resultNote:{raw:["observaciones de resultados","observaciones"]},
 resultResponsName:{raw:["nombre del responsable de la evaluacion"]},
 resultResponsRole:{raw:["cargo del responsable de la evaluacion","cargo"]},
 resultResponsMail:{raw:["correo del responsable de la evaluacion"]},
 resultResponsPhone:{raw:["extension del responsable de la evaluacion","extension"]},
 resultSignature:{raw:["firma","certificacion"]},
 terms:{raw:["condiciones normativas","requisitos generales"]}
};
const lists={
 activities:{facets:["oferta.actividad."],original:["actividades a desarrollar"],field:"activities"},
 requirements:{facets:["perfil.competencia."],original:["requisitos","perfil requerido"],field:"profile"},
 general:{facets:[],original:["requisitos generales"],field:"terms"},
 requiredDocs:{facets:["aplicacion.documento."],original:["documentacion requerida","documentos requeridos"],field:"requiredDocs"},
 optionalDocs:{facets:[],original:["documentos opcionales"],field:"optionalDocs"},
 criteria:{facets:["evaluacion.criterio."],original:["criterios de evaluacion","criterios de seleccion"],field:"criteria"},
};
const sectionsDef=[
 ["identificacion","Identificación general"],["perfil","Perfil y requisitos"],["actividades","Actividades a desarrollar"],["vinculacion","Condiciones de vinculación"],["postulacion","Postulación y documentación"],["seleccion","Proceso de selección"],["criterios","Criterios de evaluación"],["resultados","Resultados de selección"],["responsables","Responsables"],["fuentes","Fuentes y trazabilidad"]
];
let base=null,rows=[],selected=null,compared=new Set(),mode="detail",shown=[];
const cache=new WeakMap();
function originalFor(c,key){
 const aliases=arr(config[key]?.raw).map(norm), out=[];
 if(!aliases.length)return out;
 for(const d of arr(c.datos_originales)){
  const keys=[d.rotulo_literal,d.codigo_concepto].filter(present).map(norm);
  if(!keys.some(k=>aliases.some(a=>k===a||k.startsWith(a+" ("))))continue;
  if(!present(d.literal_completo))continue;
  const f=arr(c.fuentes_originales).find(f=>String(f.fuente_id)===String(d.fuente_id));
  out.push({text:String(d.literal_completo).trim(),kind:"original",origin:f?.tipo||"Dato original",url:f?.url_original||"",page:d.numero_pagina||d.pagina_original||null});
 }
 return out;
}
function facetValue(i){
 const v=i.valor?.valor_normalizado;
 if(!v)return null;
 if(v.tipo==="porcentaje_de_avance"){
  if(v.filtro_habilitado===false)return v.valor_mencionado_pct===undefined?"Mención sin comparador":"Menciona "+v.valor_mencionado_pct+" % (operador no determinado)";
  const out=[];
  if(typeof v.minimo_pct==="number")out.push((v.minimo_inclusivo?"≥ ":"> ")+numberFmt(v.minimo_pct)+" %");
  if(typeof v.maximo_pct==="number")out.push((v.maximo_inclusivo?"≤ ":"< ")+numberFmt(v.maximo_pct)+" %");
  return out.join(" y ")||null;
 }
 if(!present(v.valor))return null;
 if(i.nombre==="oferta.estimulo_mensual"&&typeof v.valor==="number")return money(v.valor)+"/mes";
 if(i.nombre==="oferta.carga_horaria"&&typeof v.valor==="number")return numberFmt(v.valor)+" h/semana";
 if(v.tipo==="COP_por_mes"&&typeof v.valor==="number")return money(v.valor)+"/mes";
 if(v.tipo==="horas_por_semana"&&typeof v.valor==="number")return numberFmt(v.valor)+" h/semana";
 if(v.tipo==="meses"&&typeof v.valor==="number")return numberFmt(v.valor)+" meses";
 return String(v.valor);
}
function facetFor(c,keys){
 const matches=[], prefixes=arr(keys);
 for(const i of arr(c.indicadores_sinteticos)){
  if(i.version_formula!=="IA-normalizacion-1.0"||!prefixes.some(p=>p.endsWith(".")?i.nombre?.startsWith(p):i.nombre===p))continue;
  const txt=facetValue(i);if(!present(txt))continue;
  const ev=arr(i.valor?.evidencias)[0];
  matches.push({text:txt,kind:"ia",origin:"Lectura IA · sin cotejo",url:ev?.url_original||"",page:ev?.numero_pagina||null,code:i.nombre,indicator:i});
 }
 return matches;
}
function values(c,key){
 const v=[...originalFor(c,key),...facetFor(c,config[key]?.facet)];
 const seen=new Set();
 return v.filter(x=>{const k=x.kind+"|"+x.text+"|"+x.origin;if(seen.has(k))return false;seen.add(k);return true});
}
function listValues(c,key){
 const def=lists[key],out=[];
 for(const l of arr(c.listas_originales)){
  const label=norm(l.titulo_literal||l.codigo_concepto);
  if(!arr(def.original).some(x=>label.includes(norm(x))))continue;
  const f=arr(c.fuentes_originales).find(f=>String(f.fuente_id)===String(l.fuente_id));
  for(const i of arr(l.items))if(present(i.literal_completo))
   out.push({text:String(i.literal_completo),kind:"original",origin:f?.tipo||"Lista original",url:f?.url_original||"",page:i.numero_pagina||null});
 }
 if(!out.length&&def.field){for(const x of originalFor(c,def.field))out.push(x)}
 for(const x of facetFor(c,def.facets))out.push(x);
 const seen=new Set();
 return out.filter(x=>{const k=norm(x.text);if(seen.has(k))return false;seen.add(k);return true});
}
function excelDate(s){
 if(!present(s))return null;
 const n=Number(s);
 if(!Number.isFinite(n)||n<20000||n>90000)return String(s);
 const d=new Date(Date.UTC(1899,11,30)+Math.round(n*86400000));
 return new Intl.DateTimeFormat("es-CO",{timeZone:"UTC",year:"numeric",month:"2-digit",day:"2-digit",hour:Number.isInteger(n)?undefined:"2-digit",minute:Number.isInteger(n)?undefined:"2-digit",hour12:false}).format(d);
}
function primary(c,key){const v=values(c,key);return v.length?v[0].text:null;}
function model(c){
 const get=k=>primary(c,k);
 const pdfs=arr(c.fuentes_originales).filter(x=>x.tipo==="resultados_pdf");
 const m={
 item:c,number:c.numero,title:get("title"),faculty:get("faculty"),program:get("program"),level:get("level"),
 state:get("state"),close:get("close"),sources:arr(c.fuentes_originales),hasResultPDF:pdfs.length>0,
 hasResults:arr(c.resultados_estructurados).length>0,
 semantic:arr(c.indicadores_sinteticos).filter(x=>x.version_formula==="IA-normalizacion-1.0"),
 };
 const corpus=[c.numero,m.title,m.faculty,m.program,m.level,m.state,
 ...arr(c.datos_originales).map(d=>d.literal_completo),
 ...m.semantic.flatMap(i=>[i.nombre,facetValue(i)]),
 ...arr(c.fuentes_originales).flatMap(f=>arr(f.pdf_lectura_previa?.datos_textuales_originales?.paginas).map(p=>p.texto_original_orden_lectura_aproximado||""))
 ];
 m.search=norm(corpus.filter(present).join(" "));
 return m;
}
function valueDisplay(x){
 const n=el("div");
 const p=el("div",null,x.text);n.append(p);
 const src=el("div","data-origin "+(x.kind==="original"?"original":""),x.kind==="ia"?"Lectura IA · sin cotejo visual":"Original · "+x.origin);
 if(safeURL(x.url)){
  const a=el("a",null,x.page?"PDF pág. "+x.page:"Ver fuente");
  a.href=x.url;a.target="_blank";a.rel="noopener noreferrer";src.append(a);
 }
 n.append(src);return n;
}
function row(label,vs){
 const r=el("div","data-row"),l=el("div","data-label",label),v=el("div","data-value");
 if(!arr(vs).length)v.append(blank());
 else arr(vs).forEach((x,i)=>{if(i>0)v.append(el("div","data-conflict","Valor adicional — revisar procedencia"));v.append(valueDisplay(x))});
 r.append(l,v);return r;
}
function facts(c,fields){
 const wrap=el("div","rows");
 for(const [key,label] of fields)wrap.append(row(label,values(c,key)));
 return wrap;
}
function section(id,title,num,wide=false){
 const s=el("section","section"+(wide?" full":""));s.id="sec-"+id;
 const h=el("div","section-header"),left=el("div","section-heading"),heading=el("h3",null,title);
 left.append(heading);h.append(left,el("span","section-index",String(num).padStart(2,"0")+" / 10"));s.append(h);return s;
}
function listBlock(c,key,title){
 const box=el("div","list-body"),h=el("div","list-title",title),list=el("ol","structured-list"),ls=listValues(c,key);
 box.append(h);
 if(!ls.length)list.append(el("li","empty-list","Sin dato — lista pendiente de carga"));
 else ls.forEach((x,i)=>{const li=el("li");li.append(el("span","list-number",String(i+1).padStart(2,"0")),valueDisplay(x));list.append(li)});
 box.append(list);return box;
}
function semList(c,keys){
 const out=[];
 for(const key of keys)out.push(...facetFor(c,[key]));
 return out;
}
function criteriaRecords(c){
 const v=listValues(c,"criteria"),out=[];
 for(const x of v){
  const match=x.text.match(/^(?:\s*\d+[.)]\s*)?([\s\S]*?)\s+(\d+(?:[.,]\d+)?)\s*%\s*$/);
  const text=match?match[1]:x.text;
  out.push({label:text,percent:match?Number(match[2].replace(",",".")):null,source:x});
 }
 return out;
}
function criteriaTable(c){
 const items=criteriaRecords(c),box=el("div","table-wrap"),table=el("table","criteria-table"),thead=el("thead"),tr=el("tr");
 ["N.º","Criterio de evaluación","Ponderación"].forEach(t=>tr.append(el("th",null,t)));thead.append(tr);table.append(thead);
 const body=el("tbody");
 if(!items.length){const r=el("tr"),td=el("td","empty-cell","Sin dato — criterios y ponderaciones no estructurados");td.colSpan=3;r.append(td);body.append(r)}
 else items.forEach((x,i)=>{
  const r=el("tr");r.append(el("td",null,i+1));
  const d=el("td");d.append(valueDisplay(x.source));r.append(d,el("td",null,x.percent!==null?numberFmt(x.percent)+" %":"Sin dato"));body.append(r);
 });
 const foot=el("tr"),d=el("td",null,"Total"),pad=el("td"),total=el("td");
 const percentages=items.map(x=>x.percent).filter(x=>typeof x==="number");
 if(items.length&&percentages.length===items.length){
  const sum=percentages.reduce((a,b)=>a+b,0);
  total.textContent=numberFmt(sum)+" %";if(Math.abs(sum-100)>.01)total.className="data-conflict";
 }else total.append(blank());
 d.style.fontWeight="800";total.style.fontWeight="800";foot.append(d,pad,total);body.append(foot);
 table.append(body);box.append(table);return box;
}
function resultTable(c){
 const results=arr(c.resultados_estructurados);
 const headings=[],seen=new Set();
 for(const r of results){
  const count=new Map();
  for(const v of arr(r.valores)){
   const title=v.encabezado_literal||"Columna sin rótulo",n=(count.get(title)||0)+1;count.set(title,n);
   const id=title+"|"+n;
   if(!seen.has(id)){seen.add(id);headings.push({id,label:title+(n>1?" ("+n+")":"")})}
  }
 }
 const dummy=["P.A.P.A. / P.A.","P.B.M.",...Array.from({length:Math.max(2,criteriaRecords(c).length)},(_,i)=>"Criterio "+(i+1)),"Total","Seleccionado","Elegible"];
 const columns=results.length?headings.map(x=>x.label):dummy;
 const box=el("div","table-wrap"),table=el("table","results-table"),head=el("thead"),tr=el("tr");
 ["N.º","Identificación","Nombre (si consta)",...columns,"Observaciones"].forEach(t=>tr.append(el("th",null,t)));head.append(tr);table.append(head);
 const body=el("tbody");
 if(!results.length){const r=el("tr"),td=el("td","empty-cell","Sin filas de participantes estructuradas. La tabla se conserva para cuando se carguen resultados.");td.colSpan=4+columns.length;r.append(td);body.append(r)}
 else results.slice().sort((a,b)=>(a.fila_original||0)-(b.fila_original||0)).forEach((item,i)=>{
  const r=el("tr"),lookup=new Map(),count=new Map();
  for(const v of arr(item.valores)){
   const title=v.encabezado_literal||"Columna sin rótulo",n=(count.get(title)||0)+1;count.set(title,n);
   lookup.set(title+"|"+n,v.valor_literal);
  }
  const vals=[item.fila_original||i+1,item.identificacion_literal,item.nombre_literal,...headings.map(h=>lookup.get(h.id)),item.observacion_literal];
  for(const v of vals){const td=el("td");td.append(present(v)?document.createTextNode(String(v)):blank());r.append(td)}body.append(r);
 });
 table.append(body);box.append(table);return box;
}
function resultState(c){
 const r=arr(c.resultados_estructurados).length,fs=arr(c.fuentes_originales).filter(f=>f.tipo==="resultados_pdf");
 if(r)return r+" filas estructuradas · cotejo documental según estado de validación";
 if(fs.length)return "PDF de resultados vinculado, sin tabla de participantes estructurada";
 return "Sin PDF de resultados vinculado; no confirma que los resultados no se publicaron";
}
function docLinks(c,types){
 const out=el("div","head-tools");
 for(const f of arr(c.fuentes_originales).filter(x=>!types||types.includes(x.tipo))){
  if(!safeURL(f.url_original))continue;
  const label=f.tipo==="convocatoria_pdf"?"Convocatoria PDF":f.tipo==="resultados_pdf"?"Resultados PDF":f.tipo==="excel"?"Excel":"Otro documento";
  const a=el("a","doclink","Abrir "+label);a.href=f.url_original;a.target="_blank";a.rel="noopener noreferrer";out.append(a);
 }
 return out;
}
function metaPanel(c){
 const s=section("fuentes","Fuentes y trazabilidad",10,true),lst=el("div","source-list");
 for(const f of arr(c.fuentes_originales)){
  const row=el("div","source-row"),lab=el("div");
  lab.append(el("div","source-name",f.nombre_literal||f.tipo||"Fuente sin título"));
  lab.append(el("div","source-meta",[f.tipo, f.sha256_pdf_nativo?"SHA-256 disponible":"sin hash",f.paginas_cotejadas+" páginas cotejadas"].join(" · ")));
  row.append(lab);
  if(safeURL(f.url_original)){const a=el("a","doclink","Abrir");a.href=f.url_original;a.target="_blank";a.rel="noopener noreferrer";row.append(a)}
  lst.append(row);
 }
 if(!lst.children.length)lst.append(el("div","missing","Sin fuentes vinculadas"));s.append(lst);
 const check=c.control_validacion||{};
 const aud=el("div","audit-grid");
 for(const key of ["A","B","C","D","E"]){
  const state=arr(check.puertas).find(x=>norm(x.codigo||x.puerta||x.nombre).includes(norm(key)))?.estado||"Sin dato";
  const v=el("div","audit-cell");v.append(el("b",null,key),el("small",null,state));aud.append(v);
 }
 s.append(aud);
 s.append(el("p","section-note",c.validada===true?"Consta como validada en exportación V3.":"Validación completa pendiente · no convertir lecturas preliminares en datos certificados."));
 const archive=(title,obj)=>{
  const details=el("details","archive"),sum=el("summary",null,title),pre=el("pre");details.append(sum,pre);
  details.addEventListener("toggle",()=>{if(details.open&&!pre.dataset.ready){pre.textContent=JSON.stringify(obj,null,2);pre.dataset.ready="true"}});s.append(details);
 };
 archive("Abrir registros originales y listas estructuradas",{datos_originales:c.datos_originales,listas_originales:c.listas_originales});
 const previews=arr(c.fuentes_originales).filter(f=>f.pdf_lectura_previa);
 for(const f of previews){
  for(const p of arr(f.pdf_lectura_previa.datos_textuales_originales?.paginas)){
   const txt=p.texto_original_orden_lectura_aproximado||p.texto_original_orden_pdf;
   if(!present(txt))continue;
   const details=el("details","archive"),sum=el("summary",null,"Lectura preliminar · "+(f.nombre_literal||f.tipo)+" · pág. "+p.numero_pagina);
   const pre=el("pre");details.append(sum,pre);
   details.addEventListener("toggle",()=>{if(details.open&&!pre.dataset.ready){pre.textContent=txt;pre.dataset.ready="true"}});s.append(details);
  }
 }
 archive("Abrir tablas, comprobaciones, incidencias y actas",{resultados_estructurados:c.resultados_estructurados,control_validacion:c.control_validacion});
 archive("Abrir facetas IA derivadas con evidencias",c.indicadores_sinteticos);
 return s;
}
function buildCase(c){
 const host=$("mainview");host.replaceChildren();
 const head=el("header","case-header"),status=el("div","head-meta");
 status.append(el("span","case-number",c.numero),el("span","pill",primary(c,"state")||"Sin estado publicado"),el("span","pill "+(c.validada?"ok":"warn"),c.validada?"Validada":"Sin validación integral"));
 head.append(status,el("h2",null,primary(c,"title")||"Título sin dato"),el("p","case-desc",[primary(c,"faculty"),primary(c,"program")].filter(present).join(" · ")||"Facultad y programa sin dato"));
 head.append(docLinks(c));host.append(head);
 const jumps=el("nav","jumpbar");jumps.setAttribute("aria-label","Apartados de la ficha");
 for(const [id,title] of sectionsDef){const b=el("button",null,title);b.type="button";b.addEventListener("click",()=>{$("sec-"+id)?.scrollIntoView({block:"start",behavior:"smooth"})});jumps.append(b)}host.append(jumps);
 const grid=el("div","sections");
 let s=section("identificacion","Identificación general",1);
 s.append(facts(c,[["faculty","Facultad"],["dependency","Dependencia / proyecto"],["program","Programa curricular"],["level","Tipo de estudiante"],["activityType","Tipo de actividad"],["state","Estado publicado"],["publish","Fecha de publicación"],["close","Cierre según Excel"],["closePDF","Cierre según PDF"],["places","Plazas"]]));
 grid.append(s);
 s=section("perfil","Perfil y requisitos",2);
 s.append(facts(c,[["profile","Perfil requerido"],["profession","Profesión o título"],["study","Posgrado / programa específico"],["advance","Avance curricular"],["papa","P.A.P.A. mínimo"],["academicStatus","Vinculación académica"],["seedbed","Grupo o semillero"],["experience","Experiencia requerida"],["exceptions","Excepciones"]]));
 s.append(listBlock(c,"requirements","Conocimientos y requisitos específicos"),listBlock(c,"general","Requisitos generales y condiciones normativas"));
 grid.append(s);
 s=section("actividades","Actividades a desarrollar",3);s.append(listBlock(c,"activities","Lista íntegra de actividades"));grid.append(s);
 s=section("vinculacion","Condiciones de vinculación",4);
 s.append(facts(c,[["modality","Modalidad"],["hours","Dedicación semanal"],["stipend","Estímulo económico"],["periodicity","Periodicidad"],["duration","Duración"],["contract","Naturaleza de la vinculación"],["conditions","Condiciones especiales"]]));
 grid.append(s);
 s=section("postulacion","Postulación y documentación",5);
 s.append(facts(c,[["close","Fecha límite (Excel)"],["closePDF","Fecha límite (PDF)"],["submission","Términos de presentación"],["channel","Medio de postulación"],["format","Formato de entrega"],["applicationRules","Instrucciones de envío"],["restrictions","Restricciones"]]));
 s.append(listBlock(c,"requiredDocs","Documentación obligatoria"),listBlock(c,"optionalDocs","Documentación opcional"));
 grid.append(s);
 s=section("seleccion","Proceso de selección",6);
 s.append(facts(c,[["selection","Forma de selección"],["enableCheck","Verificación de requisitos"],["elimination","Condiciones eliminatorias"],["scoreSystem","Sistema de calificación"],["maxScore","Puntaje máximo"],["tie","Desempate"],["eligibility","Lista de elegibles"]]));
 grid.append(s);
 s=section("criterios","Criterios de evaluación y ponderaciones",7,true);s.append(criteriaTable(c));s.append(el("p","section-note","Las ponderaciones se muestran por separado. Un total incompleto queda como «Sin dato»; los porcentajes no se completan artificialmente."));grid.append(s);
 s=section("resultados","Resultados de selección",8,true);
 s.append(facts(c,[["resultDeadline","Fecha límite anunciada"],["resultEffective","Fecha efectiva de publicación"]]));
 const resultInfo=el("div","result-stats");resultInfo.append(el("span",null,"Plazas: "+(primary(c,"places")||"Sin dato")),el("span",null,"Participantes registrados: "+arr(c.resultados_estructurados).length),el("span",null,"Estado: "+resultState(c)));
 s.append(resultInfo,resultTable(c),el("p","section-note","Si aún no hay registros estructurados, la tabla permanece visible. Una ausencia de datos no demuestra que no se hayan publicado."));
 s.append(facts(c,[["resultReason","Motivo de no selección"],["resultNote","Observaciones"],["tie","Reglas de desempate"],["eligibility","Lista de elegibles"],["resultSignature","Certificación de resultados"]]));
 grid.append(s);
 s=section("responsables","Responsables y certificaciones",9);
 s.append(el("div","subcard",null));
 s.lastElementChild.append(el("strong",null,"Responsable de la convocatoria"));
 s.append(facts(c,[["responsible","Nombre / información publicada"],["email","Correo"],["phone","Teléfono o extensión"]]));
 const sep=el("div","subcard");sep.append(el("strong",null,"Responsable de la evaluación"));s.append(sep);
 s.append(facts(c,[["resultResponsName","Nombre"],["resultResponsRole","Cargo"],["resultResponsMail","Correo"],["resultResponsPhone","Extensión"],["resultSignature","Firma o certificación"]]));
 grid.append(s);
 grid.append(metaPanel(c));host.append(grid);
}
function numeric(c,key,kind){
 const derived=values(c,key);
 for(const x of derived){
  const v=x.indicator?.valor?.valor_normalizado;
  if(v&&typeof v.valor==="number"&&Number.isFinite(v.valor))return v.valor;
  if(key==="advance"&&v&&v.filtro_habilitado!==false&&typeof v.minimo_pct==="number")return v.minimo_pct;
  let string=String(x.text);
  if(key==="stipend")string=string.replace(/\.(?=\d{3}(?:\D|$))/g,"").replace(/,(?=\d{3}(?:\D|$))/g,"");
  const match=string.match(/-?\d+(?:[.,]\d+)?/);
  if(match)return Number(match[0].replace(",","."));
 }
 return null;
}
function dateNumber(c,key){
 const v=values(c,key)[0]?.text;
 if(!present(v))return null;
 const excel=Number(v);if(Number.isFinite(excel)&&excel>20000&&excel<90000)return Math.floor(excel);
 const m=String(v).match(/(\d{1,2})[\/.-](\d{1,2})[\/.-](\d{4})/);
 if(!m)return null;
 return Math.floor((Date.UTC(+m[3],+m[2]-1,+m[1])-Date.UTC(1899,11,30))/86400000);
}
function filterValue(id){return $(id)?.value??""}
function passes(r){
 const c=r.item;
 const q=norm(filterValue("search"));
 if(q&&!r.search.includes(q))return false;
 const fieldFilters=[
  ["faculty","faculty"],["level","level"],["state","state"],["modality","modality"],["activityType","activityType"],["program","program"],["seedbed","seedbed"]
 ];
 for(const [fid,key] of fieldFilters){
  const requested=filterValue(fid);if(!requested)continue;
  const matched=key==="program"?[...values(c,"program"),...values(c,"profile"),...values(c,"profession"),...values(c,"study")]:values(c,key);
  if(!matched.some(v=>norm(v.text).includes(norm(requested))))return false;
 }
 const dataCheck=filterValue("results");
 if(dataCheck==="pdf"&&!r.hasResultPDF)return false;
 if(dataCheck==="table"&&!r.hasResults)return false;
 if(dataCheck==="none"&&(r.hasResultPDF||r.hasResults))return false;
 const missing=filterValue("missing");
 if(missing==="criteria"&&criteriaRecords(c).length>0)return false;
 if(missing==="results"&&r.hasResults)return false;
 if(missing==="profile"&&values(c,"profile").length>0)return false;
 if(missing==="stipend"&&values(c,"stipend").length>0)return false;
 if(missing==="docs"&&listValues(c,"requiredDocs").length>0)return false;
 if(missing==="responsible"&&values(c,"responsible").length>0)return false;
 const cert=filterValue("validated");
 if(cert==="yes"&&!c.validada)return false;
 if(cert==="no"&&c.validada)return false;
 const nums=[
  ["placesMin","places",">="],["placesMax","places","<="],["hoursMin","hours",">="],["hoursMax","hours","<="],
  ["stipendMin","stipend",">="],["stipendMax","stipend","<="],["papaMin","papa",">="]
 ];
 for(const [fid,key,op] of nums){
  const v=filterValue(fid);if(v==="")continue;
  const n=numeric(c,key),limit=Number(v);
  if(n===null||!Number.isFinite(limit)||(op===">="?n<limit:n>limit))return false;
 }
 const advanced=filterValue("advanceMin");
 if(advanced!==""){
  const num=Number(advanced);
  const valid=facetFor(c,["perfil.avance_plan_estudios"]).some(x=>{
   const v=x.indicator?.valor?.valor_normalizado;
   return v&&v.filtro_habilitado!==false&&typeof v.minimo_pct==="number"&&v.minimo_pct>=num;
  });
  if(!valid)return false;
 }
 const minCriteria=filterValue("criteriaMin");
 if(minCriteria!==""&&criteriaRecords(c).length<Number(minCriteria))return false;
 const starts=filterValue("start"),ends=filterValue("end");
 if(starts||ends){
  const n=dateNumber(c,"close");if(n===null)return false;
  const parse=x=>Math.floor((Date.parse(x+"T00:00:00Z")-Date.UTC(1899,11,30))/86400000);
  if(starts&&n<parse(starts))return false;
  if(ends&&n>parse(ends))return false;
 }
 return true;
}
function choices(id,key){
 const select=$(id),set=new Set();
 for(const m of rows)for(const x of values(m.item,key))if(present(x.text))set.add(x.text);
 [...set].sort((a,b)=>a.localeCompare(b,"es",{sensitivity:"base"})).forEach(v=>{const op=el("option",null,v);op.value=v;select.append(op)});
}
function updateSummary(){
 const elems=["search","faculty","program","level","state","results","modality","activityType","seedbed","missing","validated","placesMin","placesMax","hoursMin","hoursMax","stipendMin","stipendMax","advanceMin","papaMin","criteriaMin","start","end"];
 const selectedFilters=elems.filter(id=>filterValue(id)!=="");
 const badge=$("active-filters");badge.replaceChildren();
 for(const id of selectedFilters){const lbl=$("label-"+id)?.textContent||id;badge.append(el("span","filter-badge",lbl))};
 $("filter-summary").textContent=shown.length+" de "+rows.length+" convocatorias · "+selectedFilters.length+" filtros activos";
 $("metric-visible").textContent=shown.length;
 $("metric-results").textContent=shown.filter(x=>x.hasResultPDF).length;
 $("filtered-count").textContent=shown.length+" de "+rows.length;
}
function drawList(){
 const root=$("case-list");root.replaceChildren();
 if(!shown.length){root.append(el("div","empty-state","No hay convocatorias con estos filtros."));return}
 const fragment=document.createDocumentFragment();
 for(const r of shown){
  const item=el("div","case-item");item.setAttribute("aria-selected",String(r.number===selected));
  const btn=el("button","case-btn"),head=el("div","case-top");
  btn.type="button";head.append(el("span","case-code",r.number),el("span","case-status",r.state||"Sin dato"));
  btn.append(head,el("div","case-title",r.title||"Título sin dato"),el("div","case-meta",[r.faculty,r.program].filter(present).join(" · ")||"Facultad/programa sin dato"),el("div","case-meta","Cierre: "+(excelDate(r.close)||"Sin dato")));
  btn.addEventListener("click",()=>{selected=r.number;mode="detail";drawList();renderMain();$("mainview").scrollTop=0});
  const check=el("input","case-check");check.type="checkbox";check.setAttribute("aria-label","Añadir "+r.number+" a la comparación");check.checked=compared.has(r.number);check.disabled=!check.checked&&compared.size>=4;
  check.addEventListener("change",()=>{if(check.checked&&compared.size<4)compared.add(r.number);else if(!check.checked)compared.delete(r.number);drawList();updateCompareButton()});
  item.append(btn,check);fragment.append(item);
 }
 root.append(fragment);
}
function updateCompareButton(){
 const b=$("compare");b.textContent="Comparar ("+compared.size+"/4)";b.disabled=compared.size<2;
 $("show-detail").hidden=mode!=="compare";
}
function compareView(){
 const m=rows.filter(x=>compared.has(x.number)),host=$("mainview");host.replaceChildren();
 const head=el("header","comparison-header");head.append(el("div","eyebrow","Veeduría · Comparación"),el("h2",null,m.length+" convocatorias lado a lado"),el("p","case-desc","Los valores ausentes se indican explícitamente. Las lecturas IA conservan su aviso de procedencia."));
 host.append(head);
 const panel=el("div","compare-panel"),wrap=el("div","table-wrap"),table=el("table","comparison-table"),tr=el("tr");
 tr.append(el("th",null,"Parámetro"));m.forEach(x=>tr.append(el("th",null,x.number)));const thead=el("thead");thead.append(tr);table.append(thead);
 const body=el("tbody");
 const headings=[
  ["Identificación",null],["title","Nombre"],["faculty","Facultad"],["program","Programa"],["level","Nivel"],["state","Estado"],["close","Cierre"],["places","Plazas"],
  ["Perfil",null],["profile","Perfil requerido"],["advance","Avance curricular"],["papa","P.A.P.A."],["profession","Profesión"],["seedbed","Semillero"],
  ["Vinculación",null],["modality","Modalidad"],["hours","Horas/semana"],["stipend","Estímulo"],["duration","Duración"],
  ["Selección y resultados",null],["selection","Método de selección"],["criteria","Criterios y ponderaciones"],["results","Resultados estructurados"],["resultDeadline","Plazo de resultados"],["responsible","Responsable"]
 ];
 for(const [key,label] of headings){
  const row=el("tr"),first=el("td",null,label||key);first.style.fontWeight="780";row.append(first);
  if(label===null){first.style.background="#eaf3f1";first.style.color="#155f59";first.textContent=key;for(let i=0;i<m.length;i++)row.append(el("td",null,""))}
  else for(const r of m){
   const td=el("td");let v;
   if(key==="criteria")v=criteriaRecords(r.item).map(x=>x.source.text).join(" · ");
   else if(key==="results")v=arr(r.item.resultados_estructurados).length+" filas registradas";
   else v=values(r.item,key).map(x=>x.text).join(" · ");
   td.append(present(v)?document.createTextNode(key==="close"?excelDate(v):v):blank());row.append(td);
  }
  body.append(row);
 }
 table.append(body);wrap.append(table);panel.append(wrap);host.append(panel);
}
function renderMain(){
 if(mode==="compare"&&compared.size>=2)compareView();
 else{
  mode="detail";
  const row=rows.find(x=>x.number===selected);
  if(row)buildCase(row.item);else $("mainview").replaceChildren(el("div","notice","Seleccione una convocatoria de la lista."));
 }
 updateCompareButton();
}
function filterAll(){
 shown=rows.filter(passes);
 if(!shown.some(x=>x.number===selected))selected=shown[0]?.number||null;
 if(mode==="compare"&&compared.size<2)mode="detail";
 drawList();updateSummary();
 renderMain();
}
function clearFilters(){
 for(const id of ["search","faculty","program","level","state","results","modality","activityType","seedbed","missing","validated","placesMin","placesMax","hoursMin","hoursMax","stipendMin","stipendMax","advanceMin","papaMin","criteriaMin","start","end"])$(id).value="";
 filterAll();
}
function setError(message){$("filter-summary").textContent=message;$("mainview").replaceChildren(el("div","notice",message));$("case-list").replaceChildren()}
async function start(){
 try{
  const resp=await fetch(DATA_URL,{cache:"no-store"});if(!resp.ok)throw Error("HTTP "+resp.status);
  const data=await resp.json();
  if(data.version_contrato!=="3.0"||!Array.isArray(data.convocatorias)||!data.metricas)throw Error("Contrato V3 inválido");
  if(data.convocatorias.length!==data.metricas.convocatorias_identificadas)throw Error("El número de convocatorias no coincide con las métricas");
  for(const c of data.convocatorias)if(!c.numero||!Array.isArray(c.datos_originales)||!Array.isArray(c.fuentes_originales)||!Array.isArray(c.resultados_estructurados))throw Error("Expediente con campos obligatorios ausentes: "+String(c.numero));
  base=data;
  rows=data.convocatorias.map(model).sort((a,b)=>b.number.localeCompare(a.number,"es"));
  $("metric-total").textContent=rows.length;
  $("metric-validated").textContent=data.metricas.convocatorias_validadas??0;
  for(const [id,key] of [["faculty","faculty"],["level","level"],["state","state"],["modality","modality"],["activityType","activityType"]])choices(id,key);
  const url=new URL(location.href),asked=url.searchParams.get("convocatoria");
  selected=rows.some(x=>x.number===asked)?asked:rows[0]?.number||null;
  for(const field of document.querySelectorAll("[data-filter]"))field.addEventListener(field.tagName==="SELECT"?"change":"input",filterAll);
  $("reset").addEventListener("click",clearFilters);
  $("compare").addEventListener("click",()=>{if(compared.size<2)return;mode="compare";renderMain()});
  $("show-detail").addEventListener("click",()=>{mode="detail";renderMain()});
  const meta=el("details","archive"),summary=el("summary",null,"Métricas y capturas originales de la exportación V3"),pre=el("pre");
  meta.append(summary,pre);meta.addEventListener("toggle",()=>{if(meta.open&&!pre.dataset.ready){pre.textContent=JSON.stringify({metricas:base.metricas,capturas_originales:base.capturas_originales,advertencias:base.advertencias},null,2);pre.dataset.ready="true"}});$("global-meta").append(meta);
  filterAll();
 }catch(err){setError("No se pudo cargar la base documental V3: "+String(err.message||err)+". No se generaron datos ficticios.");}
}
start();
})();