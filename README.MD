# TP JAVA : Mini application de gestion bancaire avec JAVA & Spring Boot

## Introduction
TPJAVA est une mini application web qui permet de gérer une banque, ses agences, ses employés, ses clients et les comptes bancaires de ces derniers.

Avec TPJAVA, on peut:

1. Lister toutes les banques, ajouter et supprimer une banque, voir les agences de la banque,
2. Lister toutes les agences, ajouter et supprimer une agence, voir les clients et les employés de l'agence, les comptes bancaires avec et sans intéret dans l'agence,
3. Lister tous les employés, ajouter et supprimer un employé, voir les clients que cet employé gère dans l'agence,
4. Lister toutes les clients, ajouter et supprimer un client, voir les comptes bancaires avec et sans intéret du client, affecter au client un conseiller dans l'agence,
5. Rechercher un client par son nom ou son prénom,
6. Créer un compte bancaire avec ou sans intéret au client,

## Getting Started
### Prérequis

Ce projet est fait en java avec le framework Spring Boot. Pour utiliser TPJAVA, il faut avoir le JDK de java et Maven installé sur sa machine locale.


#### Base de donnée

Avec postgresql, creer une base de donnée:

```bash
createdb tp_java_2023
```



## Référence des URLs de l'application
### Démarrage

-  L'URL de base de l'application est http://localhost:8081/accueil. La liste des clients est affiché là.

### Banque

Pour voir la liste des banques, il faut aller sur http://localhost:8081/banques .

Pour afficher les informations sur une banque et la liste des villes de ses agences, il faut appuyer sur voir.

### Agence

Pour voir la liste des agences, il faut aller sur http://localhost:8081/agences .

Pour afficher les informations sur une agence, la liste des employés, la liste des clients de l'agence, la listes des comptes dans l'agence (Compte avec intérêt et compte sans intérêt), il faut appuyer sur voir.

### Employé

Pour voir la liste des employés, il faut aller sur http://localhost:8081/employes .

Pour afficher les informations sur un employé, la liste des clients qu'il conseille, il faut appuyer sur Infos.

### Client

Pour voir la liste des clients, il faut aller sur http://localhost:8081/accueil .

Pour afficher les informations sur un client, il faut appuyer sur Infos.

Depuis le client sélectionné, on peut :

- Voir les informations sur le client
- Affecter un conseiller au client
- Créer un compte bancaire au client (Compte avec intéret ou sans intéret)  
- Afficher la liste de ses comptes bancaires (Compte avec intéret et sans intéret)  

### Compte bancaire

Pour créer un compte bancaire avec ou sans intérêt, il faut aller sur http://localhost:8081/accueil , puis aller sur un client spécifique.

### Afficher les comptes à découvert

Pour afficher la liste des comptes à découvert, il faut aller sur http://localhost:8081/accueil , puis cliquer sur le bouton "Liste des comptes à découvert"