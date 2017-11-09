/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.tatuapu.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author tatuapu
 */
public class Produto implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idProduto;
    private String nome;
    private String desc;
    private String status;
    private List<Foto> fotoList;
    private Categoria categoria;
    private Pessoa idPessoa;
    private Preco idPreco;

    public Produto() {
    }

    public Produto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public Produto(Integer idProduto, String nome, String desc, String status) {
        this.idProduto = idProduto;
        this.nome = nome;
        this.desc = desc;
        this.status = status;
    }

    public Integer getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Foto> getFotoList() {
        return fotoList;
    }

    public void setFotoList(List<Foto> fotoList) {
        this.fotoList = fotoList;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Pessoa getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Pessoa idPessoa) {
        this.idPessoa = idPessoa;
    }

    public Preco getIdPreco() {
        return idPreco;
    }

    public void setIdPreco(Preco idPreco) {
        this.idPreco = idPreco;
    }
    
}
