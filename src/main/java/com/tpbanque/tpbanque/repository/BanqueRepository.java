package com.tpbanque.tpbanque.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.Banque;


public interface BanqueRepository extends JpaRepository<Banque, Long>{
}
