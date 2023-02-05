package com.tpbanque.tpbanque.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tpbanque.tpbanque.entity.CompteSansInteret;


public interface CompteBancaireSansInteretRepository extends JpaRepository<CompteSansInteret, Long>{
    List<CompteSansInteret> findAllByClientId(Long id);
}
