package com.wav.pf.entities;
// Generated 21/11/2016 19:27:40 by Hibernate Tools 4.3.1



/**
 * Subcategoria generated by hbm2java
 */
public class Subcategoria  implements java.io.Serializable {


     private Integer idsubcategoria;
     private Categoria categoria;
     private String nome;

    public Subcategoria() {
    }

    public Subcategoria(Categoria categoria, String nome) {
       this.categoria = categoria;
       this.nome = nome;
    }
   
    public Integer getIdsubcategoria() {
        return this.idsubcategoria;
    }
    
    public void setIdsubcategoria(Integer idsubcategoria) {
        this.idsubcategoria = idsubcategoria;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }




}

