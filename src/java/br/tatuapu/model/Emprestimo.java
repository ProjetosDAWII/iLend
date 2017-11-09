package br.tatuapu.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author tatuapu
 */

public class Emprestimo implements Serializable {

    private Integer idEmprestimo;
    private Date dataI;
    private Date dataFPrev;
    private String statusPgt;
    private Date dataF;
    private List<MovimentacaoFinanceira> movimentacaoFinanceiraList;
    private Pessoa idPessoa;
    private Preco idPreco;
    private Produto idProduto;

    public Emprestimo() {
    }

    public Emprestimo(Integer idEmprestimo) {
        this.idEmprestimo = idEmprestimo;
    }

    public Emprestimo(Integer idEmprestimo, Date dataI, Date dataFPrev, String statusPgt) {
        this.idEmprestimo = idEmprestimo;
        this.dataI = dataI;
        this.dataFPrev = dataFPrev;
        this.statusPgt = statusPgt;
    }

    public Integer getIdEmprestimo() {
        return idEmprestimo;
    }

    public void setIdEmprestimo(Integer idEmprestimo) {
        this.idEmprestimo = idEmprestimo;
    }

    public Date getDataI() {
        return dataI;
    }

    public void setDataI(Date dataI) {
        this.dataI = dataI;
    }

    public Date getDataFPrev() {
        return dataFPrev;
    }

    public void setDataFPrev(Date dataFPrev) {
        this.dataFPrev = dataFPrev;
    }

    public Date getDataF() {
        return dataF;
    }

    public void setDataF(Date dataF) {
        this.dataF = dataF;
    }

    public String getStatusPgt() {
        return statusPgt;
    }

    public void setStatusPgt(String statusPgt) {
        this.statusPgt = statusPgt;
    }

    public List<MovimentacaoFinanceira> getMovimentacaoFinanceiraList() {
        return movimentacaoFinanceiraList;
    }

    public void setMovimentacaoFinanceiraList(List<MovimentacaoFinanceira> movimentacaoFinanceiraList) {
        this.movimentacaoFinanceiraList = movimentacaoFinanceiraList;
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

    public Produto getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Produto idProduto) {
        this.idProduto = idProduto;
    }

    
    
}
