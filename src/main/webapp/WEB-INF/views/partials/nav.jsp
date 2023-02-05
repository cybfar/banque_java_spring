<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand fw-bold font-monospace" href="/accueil">TPJAVA</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link ${_page eq 'accueil_page' ? 'active' : ''}" href="/accueil">Accueil</a>
          </li>
          <li class="nav-item">
            <a class="nav-link ${_page eq 'agence_page' ? 'active' : ''}" href="/agences">Agences</a>
          </li>
          <li class="nav-item">
            <a class="nav-link ${_page eq 'banque_page' ? 'active' : 'aa'}" href="/banques">Banques</a>
          </li>
          <li class="nav-item">
            <a class="nav-link ${_page eq 'employe_page' ? 'active' : ''}" href="/employes">Employés</a>
          </li>
        </ul>
      </div>

      <%@ include file="searchform.jsp" %>
      
    </div>
  </nav>