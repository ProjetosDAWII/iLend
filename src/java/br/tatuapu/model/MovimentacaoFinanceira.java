/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.tatuapu.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author tatuapu
 */
public class MovimentacaoFinanceira implements Serializable {

    private Integer idMovimentacaoFinanceira;
    private String tipo;
    private long valor;
    private Date dataLancamento;
    private Date dataEfetivado;
    private String desc;
    private Emprestimo idEmprestimo;
    private Pessoa idPessoa;

    public MovimentacaoFinanceira() {
    }

    public MovimentacaoFinanceira(Integer idMovimentacaoFinanceira) {
        this.idMovimentacaoFinanceira = idMovimentacaoFinanceira;
    }

    public MovimentacaoFinanceira(Integer idMovimentacaoFinanceira, String tipo, long valor, Date dataLancamento) {
        this.idMovimentacaoFinanceira = idMovimentacaoFinanceira;
        this.tipo = tipo;
        this.valor = valor;
        this.dataLancamento = dataLancamento;
    }

    public Integer getIdMovimentacaoFinanceira() {
        return idMovimentacaoFinanceira;
    }

    public void setIdMovimentacaoFinanceira(Integer idMovimentacaoFinanceira) {
        this.idMovimentacaoFinanceira = idMovimentacaoFinanceira;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public long getValor() {
        return valor;
    }

    public void setValor(long valor) {
        this.valor = valor;
    }

    public Date getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(Date dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public Date getDataEfetivado() {
        return dataEfetivado;
    }

    public void setDataEfetivado(Date dataEfetivado) {
        this.dataEfetivado = dataEfetivado;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Emprestimo getIdEmprestimo() {
        return idEmprestimo;
    }

    public void setIdEmprestimo(Emprestimo idEmprestimo) {
        this.idEmprestimo = idEmprestimo;
    }

    public Pessoa getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Pessoa idPessoa) {
        this.idPessoa = idPessoa;
    }
    
}
