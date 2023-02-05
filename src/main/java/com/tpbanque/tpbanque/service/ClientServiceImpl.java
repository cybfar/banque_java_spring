package com.tpbanque.tpbanque.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.Employe;
import com.tpbanque.tpbanque.repository.ClientRepository;

@Service
public class ClientServiceImpl implements ClientService{

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Client createClient(Client p) {
        return clientRepository.save(p);
    }

    @Override
    public void affecterConseiller(Client client, Employe employe) {
        client.setEmploye(employe);
        clientRepository.save(client);
    }

    @Override
    public String deleteClient(Long id) {
        clientRepository.deleteById(id);
        return "Supprimé";
    }

    @Override
    public List<Client> getAllClient() {
        return clientRepository.findAll();
    }

    @Override
    public Client getClientById(Long id) {
        return clientRepository.findById(id).orElse(null);
    }
    
    public List<Client> getByNomOrPrenom(String s, String p) {
        return clientRepository.findByNomContainingOrPrenomContaining(s, p);
    }
    
}
