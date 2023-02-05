package com.tpbanque.tpbanque.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.CompteAvecInteret;
import com.tpbanque.tpbanque.entity.CompteBancaire;
import com.tpbanque.tpbanque.entity.CompteSansInteret;
import com.tpbanque.tpbanque.entity.Employe;
import com.tpbanque.tpbanque.repository.ClientRepository;
import com.tpbanque.tpbanque.repository.CompteBancaireAvecInteretRepository;
import com.tpbanque.tpbanque.repository.CompteBancaireSansInteretRepository;
import com.tpbanque.tpbanque.repository.CompteBancaireRepository;
import com.tpbanque.tpbanque.service.ClientService;
import com.tpbanque.tpbanque.service.EmployeService;
import com.tpbanque.tpbanque.service.AgenceService;


@Controller
public class CLientController{

    @Autowired
    private ClientService clientService;

    @Autowired
    private AgenceService agenceService;

    @Autowired
    private EmployeService employeService;

    @Autowired
    private CompteBancaireRepository compteBancaireRepository;

    @Autowired
    private CompteBancaireAvecInteretRepository compteBancaireAvecInteretRepository;
    
    @Autowired
    private CompteBancaireSansInteretRepository compteBancaireSansInteretRepository;
    
    @GetMapping("/accueil")
    public String listeClient(Model model) {
        List<Client> clients = clientService.getAllClient();
        List<Agence> agences = agenceService.getAllAgence();
        model.addAttribute("clients", clients);
        model.addAttribute("agences", agences);
        model.addAttribute("newclient", new Client());

        return "client";
    }

    @GetMapping("/client/{id}")
    public String infosClient(@PathVariable Long id, Model model) {
        Client client = clientService.getClientById(id);
        List<Employe> employeAgenceClient = client.getAgence().getEmployes();
        List<CompteAvecInteret> compteAvecInteret = compteBancaireAvecInteretRepository.findAllByClientId(id);
        List<CompteSansInteret> compteSansInteret = compteBancaireSansInteretRepository.findAllByClientId(id);

        //Client c = compteBancaireAvecInteretRepository.findById(2L).orElse(null).getClient();
        
        model.addAttribute("client", client);
        //model.addAttribute("c", c);
        model.addAttribute("compteAvecInteret", compteAvecInteret);
        model.addAttribute("compteSansInteret", compteSansInteret);
        model.addAttribute("employeAgenceClient", employeAgenceClient);
        model.addAttribute("newcomptebancaire", new CompteSansInteret() );
        model.addAttribute("newcomptebancaireinteret", new CompteAvecInteret() );
        return "client-details";
    }

    @PostMapping("/client/{id}/creer-compte-bancaire")
    public String creerCompteSansInteret(@PathVariable Long id, @ModelAttribute("newcomptebancaire") CompteSansInteret compteBancaire) {
        Client client = clientService.getClientById(id);
        compteBancaire.setClient(client);
        compteBancaireRepository.save(compteBancaire);
        return "redirect:/accueil";
    }

    @PostMapping("/client/{id}/creer-compte-bancaire-interet")
    public String creerCompteAvecInteret(@PathVariable Long id, @ModelAttribute("newcomptebancaireinteret") CompteAvecInteret compteBancaire) {
        Client client = clientService.getClientById(id);
        compteBancaire.setClient(client);
        compteBancaireRepository.save(compteBancaire);
        return "redirect:/accueil";
    }

    @PostMapping("/client/ajouter")
    public String ajoutClient(@ModelAttribute("newclient") Client client) {
        clientService.createClient(client);
        return "redirect:/accueil";
    }


    @PostMapping("/client/{id}/affecter-conseiller")
    public  String affecterConseiller(@PathVariable Long id, @RequestParam Long conseillerId ) {
        Client client = clientService.getClientById(id);
        Employe employe = employeService.getEmployeById(conseillerId);
        clientService.affecterConseiller(client, employe);

        return "redirect:/accueil";
    }

    @GetMapping("/client/search")
    public  String rechercherParNomOuPrenom(@RequestParam(value = "query") String query, Model model ) {
        List<Client> clients = clientService.getByNomOrPrenom(query, query);
        model.addAttribute("clients", clients);
        

        return "resultats-recherche";
    }

    @GetMapping("/client/supprimer/{id}")
    public String supprimerClient(@PathVariable Long id, Model model) {
        clientService.deleteClient(id);
        return "redirect:/accueil";
    }




    
}
