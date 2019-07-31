/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.dao;

import com.ishara.model.kupci;
import java.util.List;

/**
 *
 * @author pc
 */
public interface kupciDAO {
     public List<kupci> getCustomers();

    public void savekupac(kupci kupac);

    public kupci getkupac(int id);

    public void deletekupac(int id);

    

    public List<kupci> getkupcizaprodaju();
}
