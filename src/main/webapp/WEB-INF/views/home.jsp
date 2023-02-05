<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <title>Document</title>
</head>
<body>
    <%@ include file="partials/nav.jsp" %>
      <% String p="accueil_page" ; %>

      <div class="container mt-5">
        <h1 class="text-center bg-body-secondary py-3">Liste des clients</h1>
        <form class="d-flex my-2" role="search">
          <input class="form-control me-2" type="search" placeholder="Par nom et prénom..." aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Rechercher</button>
        </form>
        <!-- <table class="table table-bordered table-striped table-hover">
          <div class="d-flex justify-content-between table-title">
            <div>
              <span class="fw-bold">Manage Items</span>
            </div>
    
            <div>
              <button class="btn btn-sm btn-success">Add Item <i class="fas fa-plus"></i> </button>
              <button class="btn btn-sm btn-danger">Delete Item <i class="fas fa-trash"></i></button>
            </div>
          </div>
          <thead class="bg-success-subtle">
            <tr>
              <th>Name</th>
              <th>First</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>John Doe</td>
              <td>Mark</td>
            </tr>
            <tr>
              <td>John Doe</td>
              <td>Jacob</td>
            </tr>
            <tr>
              <td>John Doe</td>
              <td>@twitter</td>
            </tr>
          </tbody>
        </table> -->
    
        <table class="table table-striped table-hover">
          <div class="d-flex justify-content-between table-title">
            <div>
              <span class="fw-bold">Manage Items</span>
            </div>
    
            <div>
              <button class="btn btn-sm btn-success">Add Item <i class="fas fa-plus"></i> </button>
              <button class="btn btn-sm btn-danger">Delete Item <i class="fas fa-trash"></i></button>
            </div>
          </div>
          <thead class="bg-success-subtle">
            <tr>
              <th>Name</th>
              <th>First</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <!-- Aucun Résultat de recherche -->
    
            <!-- <tr>
              <td colspan="2" class="text-center py-4">Aucun résultat</td>
            </tr> -->
    
            <!-- Avec résultat de recherche -->
            <c:forEach items="${banques}" var="banque">
            <tr>
              <td>${banque.nom}</td>
              <td>${banque.numero}</td>
              <td>
                  <span>
                    <button class="btn btn-sm btn-primary"><i class="fa fa-eye"></i></button>
                    <button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                  </span>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
    
      </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>