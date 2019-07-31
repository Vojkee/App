/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.ManyToAny;

/**
 *
 * @author pc
 */
@Entity
@Table(name="proizvodi")
public class proizvodi {
    @Id
    @Column(name="id_proizvoda")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="naziv")
    private String naziv;
    @Column(name="kolicina")
    private int kolicina;
    @Column(name="dobavljavac")
    private String dobavljavac;
    @ManyToMany(cascade = {javax.persistence.CascadeType.DETACH,javax.persistence.CascadeType.MERGE,javax.persistence.CascadeType.PERSIST,javax.persistence.CascadeType.REFRESH})
    @JoinTable(name="prodaja",joinColumns = @JoinColumn(name="proizvod_id"),inverseJoinColumns =@JoinColumn(name = "kupac_id"))
    private List<kupci> KuPcI;

    public List<kupci> getKuPcI() {
        return KuPcI;
    }

    public void setKuPcI(List<kupci> KuPcI) {
        this.KuPcI = KuPcI;
    }
   
    
    public static String bilo_sta(int id,int id_kupca) throws ClassNotFoundException{
        StringBuilder all=new StringBuilder();
        Class.forName("com.mysql.jdbc.Driver");
        try(java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/users?zeroDateTimeBehavior=convertToNull","root","vojke123321")) {
           PreparedStatement pr=conn.prepareStatement("insert into prodaja(proizvod_id,kupac_id) values (?,?)");
           String a=Integer.toString(id);
           String b=Integer.toString(id_kupca);
            pr.setString(1,a);
            pr.setString(2,b);
          pr.executeUpdate();
           
        } catch (SQLException e) {
            System.err.println(e);
        }
        return all.toString();
    }
    
    public proizvodi() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public int getKolicina() {
        return kolicina;
    }

    public void setKolicina(int kolicina) {
        this.kolicina = kolicina;
    }

    public String getDobavljavac() {
        return dobavljavac;
    }

    public void setDobavljavac(String dobavljavac) {
        this.dobavljavac = dobavljavac;
    }

    public proizvodi(String naziv, int kolicina, String dobavljavac) {
        this.naziv = naziv;
        this.kolicina = kolicina;
        this.dobavljavac = dobavljavac;
    }

    
    public void addkupca(kupci kupac){
        if(KuPcI == null){
            KuPcI=new ArrayList<>();
        }
        KuPcI.add(kupac);
    }
    
    @Override
    public String toString() {
        return "proizvodi{" + "id=" + id + ", naziv=" + naziv + ", kolicina=" + kolicina + ", dobavljavac=" + dobavljavac + '}';
    }
    
    
}
