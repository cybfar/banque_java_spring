package com.tpbanque.tpbanque.service;

import java.util.List;

import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.Employe;

public interface ClientService {
    Client getClientById(Long id);
    Client createClient(Client p);
    void affecterConseiller(Client client, Employe employe);
    String deleteClient(Long id);
    List<Client> getAllClient();
    List<Client> getByNomOrPrenom(String nom, String prenom);
}
