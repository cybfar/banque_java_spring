package com.tpbanque.tpbanque.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.Employe;


public interface EmployeRepository extends JpaRepository<Employe, Long>{
    
}
