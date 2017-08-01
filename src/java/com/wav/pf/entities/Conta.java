package com.wav.pf.entities;
// Generated 21/11/2016 19:27:40 by Hibernate Tools 4.3.1


import java.sql.Date;

/**
 * Conta generated by hbm2java
 */
public class Conta  implements java.io.Serializable {


     private Integer idconta;
     private Carteira carteira;
     private Categoria categoria;
     private FormaPagamento formaPagamento;
     private Usuario usuario;
     private String nome;
     private double valor;
     private Date data;
     private Date dataVenc;
     private int tipo;
     private boolean contaFixa;
     private byte paga;

    public Conta() {
    }

	
    public Conta(Carteira carteira, Categoria categoria, FormaPagamento formaPagamento, Usuario usuario, String nome, double valor, Date data, int tipo, boolean contaFixa, byte paga) {
        this.carteira = carteira;
        this.categoria = categoria;
        this.formaPagamento = formaPagamento;
        this.usuario = usuario;
        this.nome = nome;
        this.valor = valor;
        this.data = data;
        this.tipo = tipo;
        this.contaFixa = contaFixa;
        this.paga = paga;
    }
    public Conta(Carteira carteira, Categoria categoria, FormaPagamento formaPagamento, Usuario usuario, String nome, double valor, Date data, Date dataVenc, int tipo, boolean contaFixa, byte paga) {
       this.carteira = carteira;
       this.categoria = categoria;
       this.formaPagamento = formaPagamento;
       this.usuario = usuario;
       this.nome = nome;
       this.valor = valor;
       this.data = data;
       this.dataVenc = dataVenc;
       this.tipo = tipo;
       this.contaFixa = contaFixa;
       this.paga = paga;
    }
   
    public Integer getIdconta() {
        return this.idconta;
    }
    
    public void setIdconta(Integer idconta) {
        this.idconta = idconta;
    }
    public Carteira getCarteira() {
        return this.carteira;
    }
    
    public void setCarteira(Carteira carteira) {
        this.carteira = carteira;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public FormaPagamento getFormaPagamento() {
        return this.formaPagamento;
    }
    
    public void setFormaPagamento(FormaPagamento formaPagamento) {
        this.formaPagamento = formaPagamento;
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
    public double getValor() {
        return this.valor;
    }
    
    public void setValor(double valor) {
        this.valor = valor;
    }
    public Date getData() {
        return this.data;
    }
    
    public void setData(Date data) {
        this.data = data;
    }
    public Date getDataVenc() {
        return this.dataVenc;
    }
    
    public void setDataVenc(Date dataVenc) {
        this.dataVenc = dataVenc;
    }
    public int getTipo() {
        return this.tipo;
    }
    
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
    public boolean isContaFixa() {
        return this.contaFixa;
    }
    
    public void setContaFixa(boolean contaFixa) {
        this.contaFixa = contaFixa;
    }
    public byte getPaga() {
        return this.paga;
    }
    
    public void setPaga(byte paga) {
        this.paga = paga;
    }




}


