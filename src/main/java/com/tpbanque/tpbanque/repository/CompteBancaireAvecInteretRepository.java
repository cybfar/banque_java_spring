package com.tpbanque.tpbanque.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.CompteAvecInteret;


public interface CompteBancaireAvecInteretRepository extends JpaRepository<CompteAvecInteret, Long>{
    List<CompteAvecInteret> findAllByClientId(Long id);

}
