package com.tpbanque.tpbanque.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.Client;


public interface ClientRepository extends JpaRepository<Client, Long>{

    List<Client> findByEmployeId(Long id);
    List<Client> findByNomContainingOrPrenomContaining(String nom, String prenom);
    
}
