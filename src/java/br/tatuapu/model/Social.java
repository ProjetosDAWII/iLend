/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.tatuapu.model;

import java.io.Serializable;

/**
 *
 * @author tatuapu
 */
public class Social implements Serializable {

    
    private Integer idSocial;
    private String url;
    private String nmRede;
    private Pessoa idPessoa;

    public Social() {
    }

    public Social(Integer idSocial) {
        this.idSocial = idSocial;
    }

    public Integer getIdSocial() {
        return idSocial;
    }

    public void setIdSocial(Integer idSocial) {
        this.idSocial = idSocial;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNmRede() {
        return nmRede;
    }

    public void setNmRede(String nmRede) {
        this.nmRede = nmRede;
    }

    public Pessoa getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Pessoa idPessoa) {
        this.idPessoa = idPessoa;
    }

    
    
}
