package com.tpbanque.tpbanque.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tpbanque.tpbanque.entity.Client;
import com.tpbanque.tpbanque.entity.Employe;
import com.tpbanque.tpbanque.repository.ClientRepository;
import com.tpbanque.tpbanque.repository.EmployeRepository;

import jakarta.transaction.Transactional;

@Service
public class EmployeServiceImpl implements EmployeService{

    @Autowired
    private EmployeRepository employeRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Employe createEmploye(Employe p) {
        return employeRepository.save(p);
    }

    @Override
    public Employe updateEmploye(Long id, Employe p) {
        return employeRepository.save(p);
    }

    @Transactional
    public void deleteEmploye(Long id) {
        Employe employe = employeRepository.findById(id).orElse(null);
        List<Client> clients = clientRepository.findByEmployeId(id);

        clients.forEach(client -> client.setEmploye(null));
        clientRepository.saveAll(clients);

        employeRepository.delete(employe);
    }

    @Override
    public List<Employe> getAllEmploye() {
        return employeRepository.findAll();
    }

    @Override
    public Employe getEmployeById(Long id) {
        return employeRepository.findById(id).orElse(null);
    }

    @Override
    public String[] numerosClientsConseils(Long id) {
        Employe employe = employeRepository.findById(id).orElse(null);
        List<Client> clients = employe.getClients();
        String[] result = new String[clients.size()]; 

        int i = 0;
        for(Client client : clients ){
            result[i] = client.getNumero();
            i++;
        }

        return result;
    }
    
}
