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
          <h1 class="text-center bg-body-secondary py-3">Résultats de la recherche</h1>
       
          <table class="table table-striped table-hover">
            <div class="d-flex justify-content-between table-title">
              <div>
                <span class="fw-bold">Résultats</span>
              </div>
            </div>
            <thead class="bg-success-subtle">
              <tr class="text-center">
                <th class="text-start">Nom complet</th>
                <th>Numéro</th>
                <th>Adresse</th>
                <th>Conseiller</th>
                <th>Agence</th>
                <th>Banque</th>
                <th class="text-center">Actions</th>
              </tr>
            </thead>
            <tbody>

              <c:forEach items="${clients}" var="client">
                <tr class="text-center">
                  <td class="text-start">${client.nom} ${client.prenom}</td>
                  <td>${client.numero}</td>
                  <td>${client.adresse}</td>
                  <td>${client.employe.nom}</td>
                  <td>${client.agence.nom}</td>
                  <td>${client.agence.banque.nom}</td>
                  <td class="text-center">
                    <span>
                      <a href="<c:url value='/client/${client.id} '/>" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Infos</a>
                      <a href="<c:url value='/client/supprimer/${client.id} '/>" class="btn btn-sm btn-danger" onclick="return confirm('Voulez vous supprimer cette client ?')"><i class="fa fa-trash"></i> Supprimer</a>
                    </span>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
    </body>

    </html>