package com.tpbanque.tpbanque.service;

import java.util.List;

import com.tpbanque.tpbanque.entity.Employe;

public interface EmployeService {
    Employe createEmploye(Employe p);
    Employe updateEmploye(Long id, Employe p);
    void deleteEmploye(Long id);
    List<Employe> getAllEmploye();
    Employe getEmployeById(Long id);
    String[] numerosClientsConseils(Long id);
}
