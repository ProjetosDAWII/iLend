/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.tatuapu.controller;

import br.tatuapu.model.Categoria;
import br.tatuapu.model.CategoriaRanking;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tatuapu
 */
@WebServlet(name = "ServletGetAjaxData", urlPatterns = {"/getDados.pvh"})
public class ServletGetAjaxData extends HttpServlet {
    
    HttpServletRequest request;
    HttpServletResponse response;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        
        String cmd = (request.getParameter("cmd")!=null) ? request.getParameter("cmd").toLowerCase().toString() : "";
        ArrayList listaRetorno = new ArrayList();
        //RequestDispatcher rd =  request.getRequestDispatcher("/home.jsp");
        
        switch(cmd){
            case "top10produtoscategoria":
                setViewData(getTop10ProdutosCategoria(),"lista-top10produtoscategoria","CategoriaRanking");
                abreViewDestino("./data/listaJSON.jsp");
                break;
            default:
                abreViewDestino("");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private ArrayList getTop10ProdutosCategoria() {
        ArrayList listaRetorno = new ArrayList();
        listaRetorno.add(new CategoriaRanking(new Categoria(1, "Livro", "livros", "livro"),50));
        listaRetorno.add(new CategoriaRanking(new Categoria(2, "Instrumentos", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(3, "Barcos", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(4, "PETs", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(5, "Armas", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(6, "Vestidos", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(7, "Roupas", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(8, "Calçados", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(9, "Ferramentas", "instrumentos musicais", "instrumentos-musicais"),48));
        listaRetorno.add(new CategoriaRanking(new Categoria(10, "Lunetas", "instrumentos musicais", "instrumentos-musicais"),48));
        
        return listaRetorno;
    }

    private void setViewData(ArrayList lista, String nmParametro, String classe) {
        this.request.setAttribute(nmParametro, lista);
        this.request.setAttribute("classe", classe);
    }

    private void abreViewDestino(String urlDestino) throws ServletException, IOException {
        if(urlDestino != "")
            this.request.getRequestDispatcher(urlDestino).forward(this.request, this.response);
        else
            this.response.sendRedirect("./");
    }

}
