package com.tpbanque.tpbanque.service;

import java.util.List;

import com.tpbanque.tpbanque.entity.Banque;

public interface BanqueService {
    Banque getBanqueById(Long id);
    Banque createBanque(Banque p);
    Banque updateBanque(Long id, Banque p);
    String deleteBanque(Long id);
    List<Banque> getAllBanque();
}
