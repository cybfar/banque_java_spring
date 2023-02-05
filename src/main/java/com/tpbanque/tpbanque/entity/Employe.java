package com.tpbanque.tpbanque.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;

@Entity
public class Employe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column
    private String nom;

    @Column
    private String prenom;

    @Column
    private String adresse;

    @Column
    private float salaire;

    @Column
    private int numINSEE;

    @ManyToOne
    @JoinColumn(name="agence_id")
    private Agence agence;

    @OneToMany(mappedBy="employe")
    private List<Client> clients;

    @Transient
    private String nomBanque;

    public Employe() {
        super();
    }

    public Employe(String nom, String prenom, String adresse, float salaire, int numINSEE, Agence agence) {
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.salaire = salaire;
        this.numINSEE = numINSEE;
        this.agence = agence;
    }

    public long getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public float getSalaire() {
        return salaire;
    }

    public void setSalaire(float salaire) {
        this.salaire = salaire;
    }

    public int getNumINSEE() {
        return numINSEE;
    }

    public void setNumINSEE(int numINSEE) {
        this.numINSEE = numINSEE;
    }

    public Agence getAgence() {
        return agence;
    }

    public void setAgence(Agence agence) {
        this.agence = agence;
    }

    public String getNomBanque() {
        return nomBanque;
    }

    public List<Client> getClients() {
        return clients;
    }

    public void setClients(List<Client> clients) {
        this.clients = clients;
    }
   
    @Override
    public String toString() {
        return "Employe [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", adresse=" + adresse + ", salaire="
                + salaire + ", numINSEE=" + numINSEE + ", agence=" + agence + ", nomBanque=" + nomBanque + "]";
    }

    

}
