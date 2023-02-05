package com.tpbanque.tpbanque;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.tpbanque.tpbanque.entity.Agence;
import com.tpbanque.tpbanque.entity.Banque;
import com.tpbanque.tpbanque.repository.BanqueRepository;
import com.tpbanque.tpbanque.service.BanqueService;



@SpringBootApplication
public class TpbanqueApplication {

	public static void main(String[] args) {
		SpringApplication.run(TpbanqueApplication.class, args);
	}

}
