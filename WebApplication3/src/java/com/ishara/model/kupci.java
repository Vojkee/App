/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author pc
 */
@Entity
@Table(name="kupci")
public class kupci {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="ime")
    private String ime;
    @Column(name="prezime")
    private String prezime;
    @ManyToMany(cascade = {javax.persistence.CascadeType.DETACH,javax.persistence.CascadeType.MERGE,javax.persistence.CascadeType.PERSIST,javax.persistence.CascadeType.REFRESH})
    @JoinTable(name="prodaja",joinColumns = @JoinColumn(name="kupac_id"),inverseJoinColumns =@JoinColumn(name = "proizvod_id"))
    private List<proizvodi> proizvodi_lista;

    public List<proizvodi> getProizvodi_lista() {
        return proizvodi_lista;
    }

    public void setProizvodi_lista(List<proizvodi> proizvodi_lista) {
        this.proizvodi_lista = proizvodi_lista;
    }
    

    public kupci() {
    }

    public kupci(String ime, String prezime) {
        this.ime = ime;
        this.prezime = prezime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

 
    @Override
    public String toString() {
        return "kupci{" + "id=" + id + ", ime=" + ime + ", prezime=" + prezime + ", kupljeni_proizvodi=" + '}';
    }
    
}
