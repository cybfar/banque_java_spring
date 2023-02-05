package com.tpbanque.tpbanque.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.CompteAvecInteret;
import com.tpbanque.tpbanque.entity.CompteSansInteret;
import com.tpbanque.tpbanque.entity.CompteBancaire;
import com.tpbanque.tpbanque.repository.AgenceRepository;
import com.tpbanque.tpbanque.repository.CompteBancaireAvecInteretRepository;
import com.tpbanque.tpbanque.repository.CompteBancaireSansInteretRepository;

@Service
public class AgenceServiceImpl implements AgenceService {

    @Autowired
    private AgenceRepository agenceRepository;

    @Autowired
    private CompteBancaireAvecInteretRepository compteBancaireAvecInteretRepository;

    @Autowired
    private CompteBancaireSansInteretRepository compteBancaireSansInteretRepository;

    @Override
    public Agence createAgence(Agence p) {
        return agenceRepository.save(p);
    }

    @Override
    public Agence updateAgence(Long id, Agence p) {
        return agenceRepository.save(p);
    }

    @Override
    public String deleteAgence(Long id) {
        agenceRepository.deleteById(id);
        return "Supprimé";
    }

    @Override
    public List<Agence> getAllAgence() {
        return agenceRepository.findAll();
    }

    @Override
    public Agence getAgenceById(Long id) {
        return agenceRepository.findById(id).orElse(null);
    }

    @Override
    public List<Client> getAllAgenceClient(Agence a) {
        List<Client> clients = a.getClients();
        return clients;
    }

    @Override
    public List<CompteAvecInteret> getAllAgenceClientComptesAvecInteret(Agence a) {
        List<Client> clients = a.getClients();
        List<CompteAvecInteret> comptes = new ArrayList<>();

        for (Client client : clients) {
            List<CompteAvecInteret> c = compteBancaireAvecInteretRepository.findAllByClientId(client.getId());
            comptes.addAll((List<CompteAvecInteret>) c);
        }

        return comptes;
    }

    @Override
    public List<CompteSansInteret> getAllAgenceClientComptesSansInteret(Agence a) {
        List<Client> clients = a.getClients();
        List<CompteSansInteret> comptes = new ArrayList<>();

        for (Client client : clients) {
            List<CompteSansInteret> c = compteBancaireSansInteretRepository.findAllByClientId(client.getId());
            comptes.addAll((List<CompteSansInteret>) c);
        }

        return comptes;
    }

}
