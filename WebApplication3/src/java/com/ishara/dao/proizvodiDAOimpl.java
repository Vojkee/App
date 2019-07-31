/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.dao;

import com.ishara.model.kupci;
import com.ishara.model.proizvodi;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author pc
 */
@Repository
public class proizvodiDAOimpl implements proizvodiDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    
    public List<proizvodi> getproizvodi() {
        Session session=sessionFactory.getCurrentSession();
         List<proizvodi>proizvodi_lista = (List<proizvodi>) session.createQuery("from proizvodi").list();
         return proizvodi_lista;
    }

    @Override
    public void saveproizvod(proizvodi proizvod) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(proizvod);
    }

    @Override
    public proizvodi getproizvodi(int id) {
       Session session=sessionFactory.getCurrentSession();
       proizvodi proizvod=(proizvodi)session.get(proizvodi.class,id);
       
       return proizvod;
    }

    @Override
    public void deleteproizvod(int id) {
          Session session=sessionFactory.getCurrentSession();
          Query   quer=session.createQuery("delete from proizvodi where id=:theproizvodid");
          quer.setParameter("theproizvodid",id);
         quer.executeUpdate();
    }

   
    
    
}
