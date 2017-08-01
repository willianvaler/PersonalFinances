package com.wav.pf.entities;
// Generated 21/11/2016 19:27:40 by Hibernate Tools 4.3.1


/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idusuario;
     private Endereco endereco;
     private String nome;
     private String login;
     private String senha;

    public Usuario() {
    }

	
    public Usuario(Endereco endereco, String nome, String login, String senha) {
        this.endereco = endereco;
        this.nome = nome;
        this.login = login;
        this.senha = senha;
    }
   
    public Integer getIdusuario() {
        return this.idusuario;
    }
    
    public void setIdusuario(Integer idusuario) {
        this.idusuario = idusuario;
    }
    public Endereco getEndereco() {
        return this.endereco;
    }
    
    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getLogin() {
        return this.login;
    }
    
    public void setLogin(String login) {
        this.login = login;
    }
    public String getSenha() {
        return this.senha;
    }
    
    public void setSenha(String senha) {
        this.senha = senha;
    }
}


