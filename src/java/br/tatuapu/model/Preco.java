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
public class Preco implements Serializable {

    
    private Integer idPreco;
    private String preco;
    private String nome;
    private String tipo;
    private String status;
    private String tipoMulta;

    public Preco() {
    }

    public Preco(Integer idPreco) {
        this.idPreco = idPreco;
    }

    public Preco(Integer idPreco, String preco, String nome, String tipo, String status, String tipoMulta) {
        this.idPreco = idPreco;
        this.preco = preco;
        this.nome = nome;
        this.tipo = tipo;
        this.status = status;
        this.tipoMulta = tipoMulta;
    }

    public Integer getIdPreco() {
        return idPreco;
    }

    public void setIdPreco(Integer idPreco) {
        this.idPreco = idPreco;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTipoMulta() {
        return tipoMulta;
    }

    public void setTipoMulta(String tipoMulta) {
        this.tipoMulta = tipoMulta;
    }
    
}
