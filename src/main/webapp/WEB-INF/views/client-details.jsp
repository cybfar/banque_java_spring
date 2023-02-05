<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@taglib prefix="c" uri="jakarta.tags.core" %>
    <%@taglib prefix="fn" uri="jakarta.tags.functions" %>
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
        <title>Agences</title>
      </head>

      <body>
        <c:set var="_page" value="accueil_page" scope="page" />
        <%@ include file="partials/nav.jsp" %>

          <div class="container mt-5">
            <h1 class="text-center bg-body-secondary py-3">${client.nom} ${client.prenom}</h1>
            ${c}
            <div class="mb-2">
              <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#compteBancaire">Créer compte Bancaire sans Intérêt<i
                class="fas fa-plus"></i> </button>
              <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#compteBancaireAvecInteret">Créer compte Bancaire avec Intérêt<i
                class="fas fa-plus"></i> </button>
              <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addConseillerModal">Affecter un Conseiller<i
                  class="fas fa-user"></i> </button>
            </div>

            <div class="row">
              <div class="col-md-12">
                <h4>Informations</h4>
                <div class="card">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">Numéro du client : ${client.numero}</li>
                    <li class="list-group-item">Adresse du client : ${client.adresse}</li>
                    <li class="list-group-item">Agence du client : ${client.agence.nom}</li>
                    <li class="list-group-item">Banque du client : ${client.agence.banque.nom}</li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="row">
              <h4 class="mt-3">Liste des comptes bancaires</h4>
              <div class="col-md-6">
                <h5 class="mt-1">Avec Interet</h5>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Numéro compte</td>
                  <td>Taux</td>
                  <td>Solde </td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${compteAvecInteret}" var="compte">
                  <tr>
                    <td>${compte.numero}</td>
                    <td>${compte.taux}</td>
                    <td>${compte.solde}</td>
                  </tr>
                </c:forEach>

              </tbody>

            </table>
              </div>
              <div class="col-md-6">
                <h5 class="mt-1">Sans Interet</h5>
            <table class="table table-striped">
              <thead class="bg-info">
                <tr>
                  <td>Numéro compte</td>
                 
                  <td>Solde </td>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${compteSansInteret}" var="compte">
                  <tr>
                    <td>${compte.numero}</td>
                    
                    <td>${compte.solde}</td>
                  </tr>
                </c:forEach>

              </tbody>

            </table>
              </div>
            </div>


            <div class="modal fade" id="addConseillerModal" data-bs-backdrop="static" data-bs-keyboard="false"
              tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Affecter un conseiller</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <c:url var="affecter_conseiller" value="/client/${client.id}/affecter-conseiller" />

                    <form action="${affecter_conseiller}" method="post">
                      <div class="mb-3">
                        <label for="nomagence" class="form-label">Nom Agence</label>
                        <input type="text" id="nomagence" value="${client.agence.nom}" name="nomagence" class="form-control" disabled />
                      </div>
                      <div class="mb-3">
                        <label for="conseiller" class="form-label">Conseiller</label>
                        <select name="conseillerId" id="conseiller" class="form-control">
                          <option value="" selected="true" disabled="false">Choisir un conseiller...</option>
                          <c:forEach items="${employeAgenceClient}" var="conseiller">
                            <option value="${conseiller.id}">${conseiller.nom} ${conseiller.prenom}</option>
                          </c:forEach>
                        </select>
                      </div>

                      <div class="modal-footer">
                        <button type="reset" class="btn btn-danger" data-bs-dismiss="modal">Retour</button>
                        <button type="submit" class="btn btn-primary">Valider</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>


            <div class="modal fade" id="compteBancaire" data-bs-backdrop="static" data-bs-keyboard="false"
              tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Créér un compte bancaire</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <c:url var="creer_compte_bancaire" value="/client/${client.id}/creer-compte-bancaire" />
                    <form:form action="${creer_compte_bancaire}" method="post" modelAttribute="newcomptebancaire">
                      <div class="mb-3">
                        <form:label path="numero" class="form-label">Numéro compte</form:label>
                        <form:input type="text" path="numero" class="form-control"  />
                      </div>
                      <div class="mb-3">
                        <form:label path="solde" class="form-label">Solde du compte</form:label>
                        <form:input type="number" path="solde" class="form-control"  />
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
            <div class="modal fade" id="compteBancaireAvecInteret" data-bs-backdrop="static" data-bs-keyboard="false"
              tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Créér un compte bancaire avec Intéret</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <c:url var="creer_compte_interet" value="/client/${client.id}/creer-compte-bancaire-interet" />
                    <form:form action="${creer_compte_interet}" method="post" modelAttribute="newcomptebancaireinteret">
                      <div class="mb-3">
                        <form:label path="numero" class="form-label">Numéro compte</form:label>
                        <form:input type="text" path="numero" class="form-control"  />
                      </div>
                      <div class="mb-3">
                        <form:label path="solde" class="form-label">Solde du compte</form:label>
                        <form:input type="number" path="solde" class="form-control"  />
                      </div>
                      <div class="mb-3">
                        <form:label path="taux" class="form-label">Taux d'intérêt</form:label>
                        <form:input type="number" path="taux" class="form-control"  />
                      </div>
                      <form:input type="hidden" path="client" class="form-control"  />
  
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