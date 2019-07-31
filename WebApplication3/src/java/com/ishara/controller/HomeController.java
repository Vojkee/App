/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ishara.controller;


import com.ishara.dao.kupciDAO;
import com.ishara.dao.proizvodiDAO;

import com.ishara.model.kupci;
import com.ishara.model.proizvodi;
import com.ishara.service.kupciService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author pc
 */
@Controller
public class HomeController {
    @Autowired
    private kupciService kupciservice;
    int i;
    int i2;
   
   @RequestMapping("/kupci")
   public String showkupce(Model themodel){
       List<kupci> thecustoemrs=kupciservice.getkupce();
        themodel.addAttribute("kupci",thecustoemrs);
        return "list-kupci";
   }
   @RequestMapping("/showFormForAdd")
   public String addkupca(Model themodel){
       kupci novi_kupac=new kupci();
       themodel.addAttribute("kupac",novi_kupac);
       return "kupac-form";
   }
   @RequestMapping(value ="/savekupac",method = RequestMethod.POST)
   public String savekupac(@ModelAttribute ("kupac") kupci kupac){
       kupciservice.savekupac(kupac);
       
       return "redirect:/kupci";
   }
   @RequestMapping(value = "/showformforupdate",method = RequestMethod.GET)
   public String update(@RequestParam("kupac_id") int id,Model themodel){
      kupci kupac=kupciservice.getKupac(id);
      themodel.addAttribute("kupac",kupac);
       return "kupac-form";
   }
   @RequestMapping(value = "/showformfordelete",method = RequestMethod.GET)
   public String delete(@RequestParam("kupac_id") int id){
       
       kupciservice.deletekupac(id);
      return "redirect:/kupci";
   }
   //------------------------ PROIZVODI LOGIKA--------------------------------------------------------
   @RequestMapping("/proizvodi_lista")
   public String showproizvode(Model themodel){
      
       List<proizvodi> proizvodi2=kupciservice.getproizvodi();
       
        themodel.addAttribute("proizvodi",proizvodi2);
        System.err.println(proizvodi2.toString());
        return "lista-proizvoda";
   }
   @RequestMapping("/showFormForAddproizvod")
   public String showproizvod(Model themodel){
       proizvodi proizvod=new proizvodi();
       themodel.addAttribute("proizvod",proizvod);
        return "proizvod-form";
   }
   @RequestMapping(value = "/saveproizvod",method = RequestMethod.POST)
   public String saveproizvod(@ModelAttribute ("proizvod") proizvodi proizvod){
       kupciservice.saveproizvod(proizvod);
       
       return "redirect:/proizvodi_lista";
   }
   
  @RequestMapping(value = "/showformforupdate-proizvod",method = RequestMethod.GET)
   public String updateproizvod(@RequestParam("proizvod_id") int id,Model themodel){
      proizvodi proizvod=kupciservice.getproizvodi(id);
      themodel.addAttribute("proizvod",proizvod);
       return "proizvod-form";
   }
    @RequestMapping(value = "/showformfordeleteforproizvod",method = RequestMethod.GET)
   public String delete2(@RequestParam("proizvod_id") int id){
       
       kupciservice.deleteproizvod(id);
      return "redirect:/proizvodi_lista";
   }
   //---------------PRODAJA LOGIKA-----------------------------------------------------------------------
   @RequestMapping("/prodaja")
   public String showprodaja(Model themodel){
       
       List<proizvodi> proizvodi2=kupciservice.getproizvodi();
       
        themodel.addAttribute("proizvodi",proizvodi2);
        System.err.println(proizvodi2.toString());
       return "prodaja";
   }
   @RequestMapping(value="/prodajproizvod",method = RequestMethod.GET)
   public String prodajkupcu(@RequestParam("proizvod_id") int id,Model themodel) throws ClassNotFoundException{
       List<kupci> thecustoemrs=kupciservice.getkupce();
        themodel.addAttribute("kupci",thecustoemrs);
        i =id;
       proizvodi a=new proizvodi();
       System.out.println("OVO JE SA BILO Sta-"+i);
        return "kupci_za_prodaju";
   }
   @RequestMapping(value = "/popunjavanjetabele",method = RequestMethod.GET)
   public String zavrsetak(@RequestParam("kupac_id") int id,Model themodel) throws ClassNotFoundException{
       proizvodi nov_proizvod=new proizvodi();
       int parametar_1=i;
       int paramter_2=id;
       nov_proizvod.bilo_sta(parametar_1,paramter_2);
       
       return "uspesna_prodaja";
   }

   
   @RequestMapping(value = "/",method = RequestMethod.GET)
   public String home(){
       return "Pocetna_Stranice";
   }
}
