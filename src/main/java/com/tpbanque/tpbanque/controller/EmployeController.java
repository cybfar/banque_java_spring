package com.tpbanque.tpbanque.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.Employe;
import com.tpbanque.tpbanque.service.EmployeService;
import com.tpbanque.tpbanque.service.AgenceService;


@Controller
public class EmployeController {

    @Autowired
    private EmployeService employeService;

    @Autowired
    private AgenceService agenceService;
    
    @GetMapping("/employes")
    public String listeEmploye(Model model) {
        List<Employe> employes = employeService.getAllEmploye();
        List<Agence> agences = agenceService.getAllAgence();
        model.addAttribute("employes", employes);
        model.addAttribute("agences", agences);
        model.addAttribute("newemploye", new Employe());

        return "employe";
    }

    @GetMapping("/employe/{id}")
    public String infosBanque(@PathVariable Long id, Model model) {
        Employe employe = employeService.getEmployeById(id);

        String[] clients = employeService.numerosClientsConseils(id);

        model.addAttribute("clients", clients);
        model.addAttribute("employe", employe);
        return "employe-details";
    }


    @PostMapping("/employe/ajouter")
    public String ajoutEmploye(@ModelAttribute("newemploye") Employe employe) {
        employeService.createEmploye(employe);
        return "redirect:/employes";
    }

    @GetMapping("/employe/supprimer/{id}")
    public String supprimerEmploye(@PathVariable Long id, Model model) {
        employeService.deleteEmploye(id);
        return "redirect:/employes";
    }


    
}
