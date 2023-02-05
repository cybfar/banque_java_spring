package com.tpbanque.tpbanque.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorColumn;
import jakarta.persistence.DiscriminatorType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "type_compte", discriminatorType = DiscriminatorType.STRING)
public abstract class CompteBancaire {
    public CompteBancaire() {
        super();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String numero;

    private double solde;
    
    @Column(insertable = true, updatable = false)
    private LocalDateTime dateOuverture = LocalDateTime.now();
    
    // @ManyToOne
    // @JoinColumn(name = "agence_id")
    // private Agence agence;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    public CompteBancaire(String numero, double solde, Client client) {
        this.numero = numero;
        this.solde = solde;
        this.client = client;
    }

    // public CompteBancaire(String numero, double solde, Agence agence, Client client) {
    //     this.numero = numero;
    //     this.solde = solde;
    //     this.agence = agence;
    //     this.client = client;
    // }


    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public double getSolde() {
        return solde;
    }

    public void setSolde(double solde) {
        this.solde = solde;
    }

    public LocalDateTime getDateOuverture() {
        return dateOuverture;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Boolean estAdecouvert() {
        return this.solde < 0;
    }


    @Override
    public String toString() {
        return "CompteBancaire [id=" + id + ", numero=" + numero + ", solde=" + solde + ", dateOuverture="
                + dateOuverture + ", client=" + client + "]";
    }
   
    // @Override
    // public String toString() {
    //     return "CompteBancaire [id=" + id + ", numero=" + numero + ", solde=" + solde + ", dateOuverture="
    //             + dateOuverture + ", agence=" + agence + ", client=" + client + "]";
    // }
   
}
