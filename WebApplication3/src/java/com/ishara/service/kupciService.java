/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.service;

import com.ishara.model.kupci;
import com.ishara.model.proizvodi;
import java.util.List;

/**
 *
 * @author pc
 */
public interface kupciService {
    public List<kupci> getkupce();

    public void savekupac(kupci kupac);

    public kupci getKupac(int id);
    public List<kupci> getKupaczaprodaju();
    

    public void deletekupac(int id);
    //proizvodi-----------------------------
     public List<proizvodi> getproizvodi();
     public void saveproizvod(proizvodi proizvod);

    public proizvodi getproizvodi(int id);

    public void deleteproizvod(int id);
    
   
}
