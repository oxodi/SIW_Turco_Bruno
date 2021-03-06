<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>SIW</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lora">

<link rel="stylesheet" href="assets/css/registration.min.css">
<script src="assets/js/jquery.min.js"></script>
<!-- Script for load Navigation Bar -->
<script>
	$(function() {
		$("#navbar").load("navBar.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
</head>

<body>
	<!-- Start: Navigation with Button -->
	<div id="navbar"></div>
	<!-- End: Navigation with Button -->
	<div class="row register-form">
		<div class="col-md-8 offset-md-2">
			<form class="custom-form" id="registrazioneCliente" method="post"
				action="RegistrationClient">
				<h1>Registrazione Cliente</h1>
				<c:if test="${sessionScope.fbUser == true}">
					<h6 style="margin-top: -30px"><strong>Benvenuto! e' la prima volta che
						effettui l'accesso, completa la form per registrarti sul nostro
						sito.</strong></h6>
						<br><br>
				</c:if>

				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Nome</label>
					</div>
					<div class="col-sm-6 input-column">
						<c:choose>
							<c:when test="${sessionScope.fbUser == true}">
								<input class="form-control" type="text" name="nome" id="nome"
									style="background-color: #8b9dc3;"
									value="${sessionScope.tempFbCliente.getNome()}" readonly>
								<a class="fa fa-facebook-square"
									style="display: inline; font-size: 20px"></a>
							</c:when>
							<c:otherwise>
								<input class="form-control" type="text" name="nome" id="nome">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Cognome</label>
					</div>
					<div class="col-sm-6 input-column">
						<c:choose>
							<c:when test="${sessionScope.fbUser == true}">
								<input class="form-control" type="text" name="cognome"
									style="background-color: #8b9dc3;"
									value="${sessionScope.tempFbCliente.getCognome()}" readonly>
								<a class="fa fa-facebook-square"
									style="display: inline; font-size: 20px"></a>
							</c:when>
							<c:otherwise>
								<input class="form-control" type="text" name="cognome">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Codice
							Fiscale</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="codice_fiscale">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Data
							di Nascita</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" placeholder="gg-mm-aaaa" name="data_di_nascita">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Indirizzo</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="indirizzo">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Citta'</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="citta">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">CAP</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="cap">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Provincia</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="provincia">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Telefono</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text" name="telefono">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="email-input-field">e-mail</label>
					</div>
					<div class="col-sm-6 input-column">
						<c:choose>
							<c:when test="${sessionScope.fbUser == true}">
								<input class="form-control" type="email" name="email"
									style="background-color: #8b9dc3;"
									value="${sessionScope.tempFbCliente.getEmail()}" readonly>
								<a class="fa fa-facebook-square"
									style="display: inline; font-size: 20px"></a>
							</c:when>
							<c:otherwise>
								<input class="form-control" type="email" name="email">
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="pawssword-input-field">Password</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="password" name="password">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="repeat-pawssword-input-field">Ripeti
							Password </label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="password">
					</div>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="formCheck-1"><label
						class="form-check-label" for="formCheck-1">Ho letto e
						accettato i termini e condizione di servizio</label>
				</div>
				<c:if test="${sessionScope.fbUser == true}">
					<a href="Login?logout=true">
						<button class="button" style="background-color: #3b5998"
							type="button" style="outline: none !important;">
							<i class="fa fa-sign-out" style="font-size: 20px">Esci da
								Facebook</i>
						</button>
					</a>
				</c:if>
				<button class="button btn" type="submit"
					style="outline: none !important;">Conferma</button>
			</form>
		</div>
	</div>
	<!-- End: Article List -->
	<!-- Start: footer -->
	<div id="footer"></div>
	<!-- End: footer -->
	<!-- Start: Projects Clean -->
	<div class="projects-clean"></div>
	<!-- End: Projects Clean -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>