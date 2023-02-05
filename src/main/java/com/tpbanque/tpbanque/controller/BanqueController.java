package com.tpbanque.tpbanque.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Banque;
import com.tpbanque.tpbanque.service.AgenceService;
import com.tpbanque.tpbanque.service.BanqueService;

import jakarta.validation.Valid;

@Controller
public class BanqueController {

    @Autowired
    private BanqueService banqueService;
    
    @GetMapping("/banques")
    public String listeBanque(Model model) {
        List<Banque> banques = banqueService.getAllBanque();
        model.addAttribute("banques", banques);
        model.addAttribute("newbanque", new Banque());

        return "banque";
    }

    @PostMapping("/banque/ajouter")
    public String ajoutBanque(@Valid @ModelAttribute("newbanque") Banque banque) {
        banqueService.createBanque(banque);
        return "redirect:/banques";
    }

    @GetMapping("/banque/{id}")
    public String infosBanque(@PathVariable Long id, Model model) {
        Banque banque = banqueService.getBanqueById(id);
        List<Agence> agences = banque.getAgences();
        model.addAttribute("banque", banque);
        model.addAttribute("agences", agences);
        return "banque-details";
    }

    @GetMapping("/banque/supprimer/{id}")
    public String supprimerBanque(@PathVariable Long id, Model model) {
        banqueService.deleteBanque(id);
        return "redirect:/banques";
    }   
}
