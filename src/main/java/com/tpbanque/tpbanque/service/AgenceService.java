package com.tpbanque.tpbanque.service;

import java.util.List;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.CompteAvecInteret;
import com.tpbanque.tpbanque.entity.CompteBancaire;
import com.tpbanque.tpbanque.entity.CompteSansInteret;


public interface AgenceService {
    Agence getAgenceById(Long id);
    Agence createAgence(Agence p);
    Agence updateAgence(Long id, Agence p);
    String deleteAgence(Long id);
    List<Agence> getAllAgence();
    List<Client> getAllAgenceClient(Agence a);
    List<CompteAvecInteret> getAllAgenceClientComptesAvecInteret(Agence a);
    List<CompteSansInteret> getAllAgenceClientComptesSansInteret(Agence a);
    
}
