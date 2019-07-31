/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.dao;

import com.ishara.model.kupci;
import com.ishara.model.proizvodi;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author pc
 */
@Repository
public interface proizvodiDAO {
     
     public List<proizvodi> getproizvodi();

    public void saveproizvod(proizvodi proizvod);

    public proizvodi getproizvodi(int id);

    public void deleteproizvod(int id);
   
   
    
    
    
    
    
    

}
