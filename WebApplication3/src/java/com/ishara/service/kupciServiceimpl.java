/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.service;

import com.ishara.dao.kupciDAO;
import com.ishara.dao.proizvodiDAO;
import com.ishara.model.kupci;
import com.ishara.model.proizvodi;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author pc
 */
@Service
public class kupciServiceimpl implements kupciService{
    @Autowired
    private kupciDAO kupciDAO;
    @Autowired
    private proizvodiDAO proizvodiDAO;
    @Override
    @Transactional
    public List<kupci> getkupce() {
        return kupciDAO.getCustomers();
    }

    @Override
    @Transactional
    public void savekupac(kupci kupac) {
        kupciDAO.savekupac(kupac);
    }

    @Override
    @Transactional
    public kupci getKupac(int id) {
       return kupciDAO.getkupac(id);
    }

    @Override
    @Transactional
    public void deletekupac(int id) {
        kupciDAO.deletekupac(id);
    }
//------------------------proizvodi-----------------------
    @Override
    @Transactional
    public List<proizvodi> getproizvodi() {
        return proizvodiDAO.getproizvodi();
    }

    @Override
    @Transactional
    public void saveproizvod(proizvodi proizvod) {
        proizvodiDAO.saveproizvod(proizvod);
    }

    @Override
    @Transactional
    public proizvodi getproizvodi(int id) {
        return proizvodiDAO.getproizvodi(id);
    }

    @Override
    @Transactional
    public void deleteproizvod(int id) {
        proizvodiDAO.deleteproizvod(id);
    }

    @Override
    public List<kupci> getKupaczaprodaju() {
      return kupciDAO.getkupcizaprodaju();
    }

 

    
    
}
