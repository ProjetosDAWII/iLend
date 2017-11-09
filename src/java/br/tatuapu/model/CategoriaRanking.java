/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.tatuapu.model;

/**
 *
 * @author tatuapu
 */
public class CategoriaRanking {
    private Categoria categoria;
    private Integer qtdProdutos;

    public CategoriaRanking(Categoria categoria, Integer qtdProdutos) {
        this.categoria = categoria;
        this.qtdProdutos = qtdProdutos;
    }

    /**
     * @return the categoria
     */
    public Categoria getCategoria() {
        return categoria;
    }

    /**
     * @return the qtdProdutos
     */
    public Integer getQtdProdutos() {
        return qtdProdutos;
    }
    
}
