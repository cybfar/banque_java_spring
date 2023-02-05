package com.tpbanque.tpbanque.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.Agence;


public interface AgenceRepository extends JpaRepository<Agence, Long>{
    
}
