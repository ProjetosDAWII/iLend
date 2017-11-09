<%-- 
    Document   : listaJSON
    Created on : 08/11/2017, 17:22:48
    Author     : tatuapu
--%>

<%@page import="java.io.StringWriter"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.tatuapu.model.CategoriaRanking"%>
<%@page import="org.json.simple.*"%>
<% 
JSONObject dados = new JSONObject();
JSONParser parser = new JSONParser();
String saida = "";
String classe = (request.getAttribute("classe")!=null) ? request.getAttribute("classe").toString() : "";
ArrayList<CategoriaRanking> lista;
if(classe.equalsIgnoreCase("CategoriaRanking")){
    lista = (ArrayList<CategoriaRanking>) request.getAttribute("lista-top10produtoscategoria");
    int i = 1;
    JSONObject pai = new JSONObject();
    JsonArray filhos = new JsonArray();
    for(CategoriaRanking cr : lista){
        
        dados = new JSONObject();
        dados.put("qtdProdutos",cr.getQtdProdutos().toString());
        dados.put("desc",cr.getCategoria().getDesc());
        dados.put("nome",cr.getCategoria().getNome());
        dados.put("idCategoria",cr.getCategoria().getIdCategoria().toString());
        
        filhos.add(dados);
        
        
//        saida+= dados.toJSONString();
//        if(i!=lista.size()) saida+=",";
//        i++;
    }
    pai.put("data", filhos);
    out.print(pai);
//    out.println("{");
//    out.println(saida);
//    out.println("}");
}
%>
