package com.tpbanque.tpbanque.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Banque;
import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.CompteAvecInteret;
import com.tpbanque.tpbanque.entity.CompteBancaire;
import com.tpbanque.tpbanque.entity.CompteSansInteret;
import com.tpbanque.tpbanque.entity.Employe;
import com.tpbanque.tpbanque.repository.CompteBancaireAvecInteretRepository;
import com.tpbanque.tpbanque.service.AgenceService;
import com.tpbanque.tpbanque.service.BanqueService;


@Controller
public class AgenceController {

    @Autowired
    private AgenceService agenceService;

    @Autowired
    private BanqueService banqueService;

    @Autowired
    private CompteBancaireAvecInteretRepository compteBancaireAvecInteretRepository;
    
    @GetMapping("/agences")
    public String listeAgence(Model model) {
        List<Agence> agences = agenceService.getAllAgence();
        List<Banque> banques = banqueService.getAllBanque();
        model.addAttribute("agences", agences);
        model.addAttribute("banques", banques);
        model.addAttribute("newagence", new Agence());

        return "agence";
    }

    @GetMapping("/agence/{id}")
    public String infosBanque(@PathVariable Long id, Model model) {
        Agence agence = agenceService.getAgenceById(id);
        List<Employe> employes = agence.getEmployes();
        List<Client> clients = agenceService.getAllAgenceClient(agence);

        List<CompteAvecInteret> compteAvecInterets = agenceService.getAllAgenceClientComptesAvecInteret(agence);
        List<CompteSansInteret> compteSansInterets = agenceService.getAllAgenceClientComptesSansInteret(agence);
       

        model.addAttribute("agence", agence);
        model.addAttribute("compteAvecInterets", compteAvecInterets);
        model.addAttribute("compteSansInterets", compteSansInterets);
        model.addAttribute("employes", employes);
        model.addAttribute("clients", clients);
        return "agence-details";
    }

    @PostMapping("/agence/ajouter")
    public String ajoutAgence(@ModelAttribute("newagence") Agence agence) {
        agenceService.createAgence(agence);
        return "redirect:/agences";
    }

    @GetMapping("/agence/supprimer/{id}")
    public String supprimerAgence(@PathVariable Long id, Model model) {
        agenceService.deleteAgence(id);
        return "redirect:/agences";
    }


    
}
