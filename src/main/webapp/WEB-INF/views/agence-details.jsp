<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@taglib prefix="fn" uri="jakarta.tags.functions" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
      <link rel="stylesheet" href="/css/style.css">
      <title>Agences</title>
    </head>

    <body>
      <c:set var="_page" value="agence_page" scope="page" />
      <%@ include file="partials/nav.jsp" %>

      <div class="container mt-5">
        <h1 class="text-center bg-body-secondary py-3">${agence.nom}</h1>
        ${comptes}
        <div class="row">
          <div class="col-md-12">
            <h4>Informations</h4>
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Adresse de la agence : ${agence.numero}</li>
                <li class="list-group-item">Adresse de la agence : ${agence.nomDirecteur}</li>
                <li class="list-group-item">Adresse de la agence : ${agence.adresse}</li>
                <li class="list-group-item">Capital : ${agence.ville}</li>
                <li class="list-group-item">Numéro : ${agence.codePostal}</li>
              </ul>
            </div>
          </div>
    
    
          
        </div>

        <div class="row mt-5">
          <div class="col-md-6">
            <h4>Employés</h4>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Nom Employé</td>
                  <td>Numéro INSEE </td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${employes}" var="employe">
                  <tr>
                    <td>${employe.nom} ${employe.prenom}</td>
                    <td>${employe.numINSEE}</td>
                  </tr>
                </c:forEach>

              </tbody>
              
            </table>
            <c:if test="${fn:length(employes) == 0}">
                    Aucun employe
                  </c:if>
          </div>

          <div class="col-md-6">
            <h4>Clients</h4>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Nom client</td>
                  <td>Numéro client </td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${clients}" var="client">
                  <tr>
                    <td>${client.nom} ${client.prenom}</td>
                    <td>${client.numero}</td>
                  </tr>
                </c:forEach>

              </tbody>
              
            </table>
            <c:if test="${fn:length(clients) == 0}">
                    Aucun client
                  </c:if>
          </div>
        </div>
        <div class="row mt-2">
          <h1>Listes des comptes dans l'agence</h1>
          <div class="col-md-6">
            <h4>Comptes avec Interet</h4>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Numéro compte</td>
                  <td>Solde Compte </td>
                  <td>Taux</td>
                  <td>Propriétaire</td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${compteAvecInterets}" var="compte">
                  <tr>
                    <td>${compte.numero}</td>
                    <td>${compte.solde}</td>
                    <td>${compte.taux}</td>
                    <td>${compte.client.nom} ${compte.client.prenom}</td>
                  </tr>
                </c:forEach>

              </tbody>
              
            </table>
            <c:if test="${fn:length(compteAvecInterets) == 0}">
                    Aucun compte
                  </c:if>
          </div>
          <div class="col-md-6">
            <h4>Comptes sans Interet</h4>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Numéro compte</td>
                  <td>Solde Compte </td>
                  <td>Propriétaire</td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${compteSansInterets}" var="compte">
                  <tr>
                    <td>${compte.numero}</td>
                    <td>${compte.solde}</td>
                    <td>${compte.client.nom} ${compte.client.prenom}</td>
                  </tr>
                </c:forEach>

              </tbody>
              
            </table>
            <c:if test="${fn:length(compteSansInterets) == 0}">
                    Aucun compte
                  </c:if>
          </div>

          
        </div>

      </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
    </body>

    </html>