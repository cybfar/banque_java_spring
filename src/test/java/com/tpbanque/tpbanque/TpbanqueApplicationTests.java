package com.tpbanque.tpbanque;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.tpbanque.tpbanque.entity.Banque;
import com.tpbanque.tpbanque.entity.CompteBancaire;
import com.tpbanque.tpbanque.repository.CompteBancaireRepository;
import com.tpbanque.tpbanque.service.BanqueService;

@SpringBootTest
class TpbanqueApplicationTests {

	@Autowired
	private BanqueService banqueService;

	@Autowired
	private CompteBancaireRepository compteBancaireRepository;

	@Test
	public void testAddBanque() {
		Banque bank = new Banque("UBA", "+78 181 8418 18", 7_500_000_000.0F, "Quartier Latin");
		banqueService.createBanque(bank);
	}

	// @Test
	// public void testFindCompte(){
	// 	List<CompteBancaire> comptes = compteBancaireRepository.findAvecInteretCompte();
		
	// 	for(CompteBancaire c:comptes){
	// 		System.out.println(c.toString());
	// 	}
	// }

	@Test
	void contextLoads() {
	}

}
