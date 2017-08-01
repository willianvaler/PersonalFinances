package com.wav.pf.entities;
// Generated 21/11/2016 19:27:40 by Hibernate Tools 4.3.1



/**
 * Carteira generated by hbm2java
 */
public class Carteira  implements java.io.Serializable {


     private Integer idcarteira;
     private Usuario usuario;
     private String nome;
     private double saldo;

    public Carteira() {
    }

	
    public Carteira(Usuario usuario, String nome, double saldo) {
        this.usuario = usuario;
        this.nome = nome;
        this.saldo = saldo;
    }
   
    public Integer getIdcarteira() {
        return this.idcarteira;
    }
    
    public void setIdcarteira(Integer idcarteira) {
        this.idcarteira = idcarteira;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public double getSaldo() {
        return this.saldo;
    }
    
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}

