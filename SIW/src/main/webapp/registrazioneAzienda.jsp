<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script src="jquery.js"></script>
<script> 
    $(function(){
      $("#navbar").load("navBar.jsp"); 
    });
    </script>
</head>

<body>
	<!-- Start: Navigation with Button -->
	<div id="navbar"></div>
	<!-- End: Navigation with Button -->
	<div class="row register-form">
		<div class="col-md-8 offset-md-2">
			<form class="custom-form" id="regFormAzienda" method="post"
				action="Registration">
				<h1>Registrazione Azienda</h1>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Ragione
							sociale</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Indirizzo</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">CAP</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Città</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Provincia</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Tel.</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">P.
							Iva</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="email-input-field">Email
						</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="email">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="pawssword-input-field">Password
						</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="password">
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
				<button class="btn btn-light submit-button" type="button">Submit
					Form</button>
			</form>
		</div>
	</div>
	<!-- Start: Footer Basic -->
	<div class="footer-basic"
		style="background-color: rgb(99, 198, 90); height: 50px; color: rgb(75, 75, 77);">
		<footer>
			<!-- Start: Copyright -->
			<p class="copyright"
				style="color: rgb(4, 4, 4); background-color: #63c65a; padding: 15px;">Unical
				©Copyright 2019</p>
			<!-- End: Copyright -->
		</footer>
	</div>
	<!-- End: Footer Basic -->
	<!-- Start: Projects Clean -->
	<div class="projects-clean"></div>
	<!-- End: Projects Clean -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>