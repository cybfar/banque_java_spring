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
      <title>Banques</title>
    </head>

    <body>
      <c:set var="_page" value="banque_page" scope="page" />
      <%@ include file="partials/nav.jsp" %>

        <div class="container mt-5">
          <h1 class="text-center bg-body-secondary py-3">Banques</h1>
          <table class="table table-striped table-hover">
            <div class="d-flex justify-content-between table-title">
              <div>
                <span class="fw-bold">Gérer les banques</span>
              </div>

              <div class="mb-2">
                <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#addBanqueModal">Ajouter
                  une banque <i class="fas fa-plus"></i> </button>
              </div>
            </div>
            <thead class="bg-success-subtle">
              <tr class="text-center">
                <th class="text-start">Nom</th>
                <th>Numéro</th>
                <th>Adresse</th>
                <th class="text-center">Actions</th>
              </tr>
            </thead>
            <tbody>

              <c:forEach items="${banques}" var="banque">
                <tr class="text-center">
                  <td class="text-start">${banque.nom}</td>
                  <td>${banque.numero}</td>
                  <td>${banque.adresseSiege}</td>
                  <td class="text-center">
                    <span>
                      <a href="<c:url value='/banque/${banque.id} '/>" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i> Voir</a>
                      <a href="<c:url value='/banque/supprimer/${banque.id} '/>" class="btn btn-sm btn-danger" onclick="return confirm('Voulez vous supprimer cette banque ?')"><i class="fa fa-trash"></i> Supprimer</a>
                    </span>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>


          <!-- Modal Add-->
          <div class="modal fade" id="addBanqueModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="staticBackdropLabel">Ajouter une banque</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <c:url var="add_banque" value="/banque/ajouter"/>

                  <form:form action="${add_banque}" method="post" modelAttribute="newbanque">
                    <div class="mb-3">
                      <form:label path="nom" class="form-label">Nom</form:label>
                      <form:input type="text" path="nom" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="adresseSiege" class="form-label">Adresse siège</form:label>
                      <form:input type="text" path="adresseSiege" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="numero" class="form-label">Numéro</form:label>
                      <form:input type="text" path="numero" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="capital" class="form-label">Capital</form:label>
                      <form:input type="number" path="capital" class="form-control"  />
                    </div>
                    </div>
                <div class="modal-footer">
                  <button type="reset" class="btn btn-danger" data-bs-dismiss="modal">Retour</button>
                  <button type="submit" class="btn btn-primary">Valider</button>
                </div>
              </form:form>
              </div>
            </div>
          </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
    </body>

    </html>