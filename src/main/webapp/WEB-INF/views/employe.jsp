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
      <title>Employés</title>
    </head>

    <body>
      <c:set var="_page" value="employe_page" scope="page" />
      <%@ include file="partials/nav.jsp" %>

        <div class="container mt-5">
          <h1 class="text-center bg-body-secondary py-3">Employés</h1>
       
          <table class="table table-striped table-hover">
            <div class="d-flex justify-content-between table-title">
              <div>
                <span class="fw-bold">Gérer les employés</span>
              </div>

              <div class="mb-2">
                <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#addEmployeModal">Ajouter
                  une employé <i class="fas fa-plus"></i> </button>
              </div>
            </div>
            <thead class="bg-success-subtle">
              <tr class="text-center">
                <th class="text-start">Nom complet</th>
                <th>Numéro INSEE</th>
                <th>Adresse</th>
                <th>Agence</th>
                <th>Banque</th>
                <th>Salaire</th>
                <th class="text-center">Actions</th>
              </tr>
            </thead>
            <tbody>

              <c:forEach items="${employes}" var="employe">
                <tr class="text-center">
                  <td class="text-start">${employe.nom} ${employe.prenom}</td>
                  <td>${employe.numINSEE}</td>
                  <td>${employe.adresse}</td>
                  <td>${employe.agence.nom}</td>
                  <td>${employe.agence.banque.nom}</td>
                  <td>${employe.salaire}</td>
                  <td class="text-center">
                    <span>
                      <a href="<c:url value='/employe/${employe.id} '/>" class="btn btn-sm btn-primary" ><i class="fa fa-eye"></i> Infos</a>
                      <a href="<c:url value='/employe/supprimer/${employe.id} '/>" class="btn btn-sm btn-danger" onclick="return confirm('Voulez vous supprimer cette employé ?')"><i class="fa fa-trash"></i> Supprimer</a>
                    </span>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <div class="modal fade" id="addEmployeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="staticBackdropLabel">Ajouter une employe</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <c:url var="add_employe" value="/employe/ajouter"/>

                  <form:form action="${add_employe}" method="post" modelAttribute="newemploye">
                    <div class="mb-3">
                      <form:label path="nom" class="form-label">Nom</form:label>
                      <form:input type="text" path="nom" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="prenom" class="form-label">Prénom</form:label>
                      <form:input type="text" path="prenom" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="adresse" class="form-label">Adresse</form:label>
                      <form:input type="text" path="adresse" class="form-control"  />
                    </div>
                    <div class="mb-3">
                      <form:label path="numINSEE" class="form-label">Numéro INSEE</form:label>
                      <form:input type="number" path="numINSEE" class="form-control"  />
                    </div>

                    <div class="mb-3">
                      <form:label path="agence" class="form-label">Agence</form:label>
                      <form:select path="agence" class="form-control">
                        <form:option value="">Sélectionner une agence</form:option>
                        <form:options items="${agences}" itemValue="id" itemLabel="nom"></form:options>
                    </form:select>
                    </div>


                    <div class="mb-3">
                      <form:label path="salaire" class="form-label">Salaire</form:label>
                      <form:input type="number" path="salaire" class="form-control"  />
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