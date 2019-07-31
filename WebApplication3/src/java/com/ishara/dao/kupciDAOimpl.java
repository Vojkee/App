/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.dao;


import com.ishara.model.kupci;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author pc
 */
@Repository
public class kupciDAOimpl implements kupciDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<kupci> getCustomers() {
        Session session=sessionFactory.getCurrentSession();
         List<kupci> kupci_lista = (List<kupci>) session.createQuery("from kupci").list();
         
         return kupci_lista;
    }

    @Override
    public void savekupac(kupci kupac) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(kupac);
    }

    @Override
    public kupci getkupac(int id) {
       Session session=sessionFactory.getCurrentSession();
       kupci kupac=(kupci)session.get(kupci.class,id);
       return kupac;
    }

    @Override
    public void deletekupac(int id) {
        Session session=sessionFactory.getCurrentSession();
        Query thequery=session.createQuery("delete from kupci where id=:kupac_id");
        thequery.setParameter("kupac_id", id);
        thequery.executeUpdate();
    }

    @Override
    public List<kupci> getkupcizaprodaju() {
        Session session=sessionFactory.getCurrentSession();
         
List<kupci> kupci_lista = (List<kupci>) session.createQuery("select kupac.ime from kupci kupac").list();
          return kupci_lista;
    }
    
}
