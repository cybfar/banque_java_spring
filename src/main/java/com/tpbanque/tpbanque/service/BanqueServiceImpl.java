package com.tpbanque.tpbanque.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tpbanque.tpbanque.entity.Banque;
import com.tpbanque.tpbanque.repository.BanqueRepository;

@Service
public class BanqueServiceImpl implements BanqueService{

    @Autowired
    private BanqueRepository banqueRepository;

    @Override
    public Banque createBanque(Banque p) {
        return banqueRepository.save(p);
    }

    @Override
    public Banque updateBanque(Long id, Banque p) {
        return banqueRepository.save(p);
    }

    @Override
    public String deleteBanque(Long id) {
        banqueRepository.deleteById(id);
        return "Supprimé";
    }

    @Override
    public List<Banque> getAllBanque() {
        return banqueRepository.findAll();
    }

    @Override
    public Banque getBanqueById(Long id) {
        return banqueRepository.findById(id).orElse(null);
    }
    
}
