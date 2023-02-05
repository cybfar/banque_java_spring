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
      <title>Banques</title>
    </head>

    <body>
      <c:set var="_page" value="banque_page" scope="page" />
      <%@ include file="partials/nav.jsp" %>

      <div class="container mt-5">
        <h1 class="text-center bg-body-secondary py-3">${banque.nom}</h1>
        <div class="row">
          <div class="col-md-6">
            <h4>Informations</h4>
            <div class="card">
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Adresse de la banque : ${banque.adresseSiege}</li>
                <li class="list-group-item">Capital : ${banque.capital}</li>
                <li class="list-group-item">Numéro : ${banque.numero}</li>
              </ul>
            </div>
          </div>
    
    
          <div class="col-md-6">
            <h4>Agences</h4>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Nom Agence</td>
                  <td>Ville Agence</td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${agences}" var="agence">
                  <tr>
                    <td>${agence.nom}</td>
                    <td>${agence.ville}</td>
                  </tr>
                </c:forEach>

              </tbody>
              
            </table>
            <c:if test="${fn:length(agences) == 0}">
                    Aucune agence
                  </c:if>
          </div>
        </div>
      </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
    </body>

    </html>