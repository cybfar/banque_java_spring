package com.tpbanque.tpbanque.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tpbanque.tpbanque.entity.CompteBancaire;


public interface CompteBancaireRepository extends JpaRepository<CompteBancaire, Long>{

}
