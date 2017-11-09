package br.tatuapu.model;

/**
 *
 * @author tatuapu
 */
public class Categoria {
    private final Integer idCategoria;
    private final String nome;
    private final String desc;
    private final String apelido;

    public Categoria(Integer idCategoria, String nome, String desc, String apelido) {
        this.idCategoria = idCategoria;
        this.nome = nome;
        this.desc = desc;
        this.apelido = apelido;
    }

    /**
     * @return the idCategoria
     */
    public Integer getIdCategoria() {
        return idCategoria;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @return the apelido
     */
    public String getApelido() {
        return apelido;
    }
    
}
