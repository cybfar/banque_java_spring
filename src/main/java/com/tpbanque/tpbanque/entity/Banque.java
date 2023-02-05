package com.tpbanque.tpbanque.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;

@Entity
public class Banque {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column()
    private String nom;

    @Column()
    private String numero;

    @Column()
    private Float capital;

    @Column()
    private String adresseSiege;

    @OneToMany(mappedBy="banque", cascade=CascadeType.ALL)
    private List<Agence> agences;
   
    @Transient
    private Integer[] numSalaries;

    public List<Agence> getAgences() {
        return agences;
    }

    public void setAgences(List<Agence> agences) {
        this.agences = agences;
    }

    @Transient
    private String[] villesAgences;

    public Banque() {
        super();
    }

    public Banque(String nom, String numero, Float capital, String adresseSiege) {
        this.nom = nom;
        this.numero = numero;
        this.capital = capital;
        this.adresseSiege = adresseSiege;
    }

    public Long getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Float getCapital() {
        return capital;
    }

    public void setCapital(Float capital) {
        this.capital = capital;
    }

    public String getAdresseSiege() {
        return adresseSiege;
    }

    public void setAdresseSiege(String adresseSiege) {
        this.adresseSiege = adresseSiege;
    }

    public Integer[] getNumSalaries() {
        return numSalaries;
    }

    public void setNumSalaries(Integer[] numSalaries) {
        this.numSalaries = numSalaries;
    }

    public String[] getVillesAgences() {
        return villesAgences;
    }

    public void setVillesAgences(String[] villesAgences) {
        this.villesAgences = villesAgences;
    }

    @Override
    public String toString() {
        return "Banque [id=" + id + ", nom=" + nom + ", numero=" + numero + ", capital=" + capital + ", adresseSiege="
                + adresseSiege + "]";
    }

    
}
