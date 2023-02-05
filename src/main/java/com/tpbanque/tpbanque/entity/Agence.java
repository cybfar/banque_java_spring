package com.tpbanque.tpbanque.entity;

import java.util.List;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Transient;

@Entity
public class Agence {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String numero;

    @Column
    private String nom;

    @Column
    private String adresse;

    @Column
    private String ville;

    @Column
    private String codePostal;

    @Column
    private String nomDirecteur;

    @ManyToOne
    @JoinColumn(name="banque_id")
    private Banque banque;

    @OneToMany(mappedBy="agence", cascade=CascadeType.ALL)
    private List<Employe> employes;

    @OneToMany(mappedBy="agence", cascade=CascadeType.ALL, orphanRemoval = true)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<Client> clients;

    @Transient
    private String nomBanque;


    public Agence() {
        super();
    }

    public Agence(String numero, String nom, String adresse, String ville, String codePostal, String nomDirecteur,
            Banque banque) {
        this.numero = numero;
        this.nom = nom;
        this.adresse = adresse;
        this.ville = ville;
        this.codePostal = codePostal;
        this.nomDirecteur = nomDirecteur;
        this.banque = banque;
    }

    public Long getId() {
        return id;
    }
    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public String getNomDirecteur() {
        return nomDirecteur;
    }

    public void setNomDirecteur(String nomDirecteur) {
        this.nomDirecteur = nomDirecteur;
    }

    public Banque getBanque() {
        return banque;
    }

    public void setBanque(Banque banque) {
        this.banque = banque;
    }

    public String getNomBanque() {
        return nomBanque;
    }

    public List<Employe> getEmployes() {
        return employes;
    }

    public void setEmployes(List<Employe> employes) {
        this.employes = employes;
    }

    public List<Client> getClients() {
        return clients;
    }

    public void setClients(List<Client> clients) {
        this.clients = clients;
    }


    @Override
    public String toString() {
        return "Agence [id=" + id + ", numero=" + numero + ", nom=" + nom + ", adresse=" + adresse + ", ville=" + ville
                + ", codePostal=" + codePostal + ", nomDirecteur=" + nomDirecteur + ", banque=" + banque
                + ", nomBanque=" + nomBanque + "]";
    }    
    

    

}
