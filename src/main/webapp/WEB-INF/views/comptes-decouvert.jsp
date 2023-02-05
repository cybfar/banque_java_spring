<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
      <link rel="stylesheet" href="/css/style.css">
      <title>Clients</title>
    </head>

    <body>
      <c:set var="_page" value="accueil_page" scope="page" />
      <%@ include file="partials/nav.jsp" %>

        <div class="container mt-5">
          <h1 class="text-center bg-body-secondary py-3">Comptes à découverts</h1>
       
          <table class="table table-striped table-hover">
            <div class="d-flex justify-content-between table-title">
              <div>
                <span class="fw-bold">Liste des comptes à découvert</span>
              </div>
            </div>
            <thead class="bg-success-subtle">
              <tr class="text-center">
                <th class="text-start">Propriétaire</th>
                <th>Numéro compte</th>
                <th>Solde</th>
                <th>Agence</th>
                <th>Banque</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${comptes}" var="compte">
                <tr class="text-center">
                  <td class="text-start">${compte.client.nom} ${compte.client.prenom}</td>
                  <td>${compte.numero}</td>
                  <td>${compte.solde}</td>
                  <td>${compte.client.employe.agence.nom}</td>
                  <td>${compte.client.employe.agence.banque.nom}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
    </body>

    </html>