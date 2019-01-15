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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
<link rel="stylesheet" href="assets/css/home.min.css">
<link rel="stylesheet" href="assets/css/registration.min.css">
</head>

<body>
	<!-- Start: Navigation with Button -->
	<div>
		<nav
			class="navbar navbar-light navbar-expand-md navigation-clean-button"
			style="background-color: transparent; position: relative; z-index: 2000">
			<div class="container">
				<a class="navbar-brand" href="#" title="LucaBrunoDance"> <img
					style="max-width: 200px; margin-top: -10px;"
					src="assets/img/logo2.png">
				</a>
				<button class="navbar-toggler" data-toggle="collapse"
					data-target="#navcol-1">
					<span class="sr-only">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav mr-auto">
						<li class="nav-item" role="presentation"><a class="nav-link"
							href="#">Prenota un terreno</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							href="#">Ordina un prodotto</a></li>
						<li class="dropdown nav-item"><a
							class="dropdown-toggle nav-link" data-toggle="dropdown"
							aria-expanded="false" href="#">Dropdown </a>
							<div class="dropdown-menu" role="menu">
								<a class="dropdown-item" role="presentation" href="#">First
									Item</a><a class="dropdown-item" role="presentation" href="#">Second
									Item</a><a class="dropdown-item" role="presentation" href="#">Third
									Item</a>
							</div></li>
					</ul>

					<span class="navbar-text actions"> <a
						class="btn btn-light action-button" role="button"
						href="Registration" style="background-color: green">Accedi</a>
					</span>
				</div>

			</div>
		</nav>
	</div>
	<!-- End: Navigation with Button -->
	<div class="row register-form">
		<div class="col-md-8 offset-md-2">
			<form class="custom-form" id="regFormAzienda" method="post"
				action="Registration")>
				<h1>Registrazione Cliente</h1>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Nome</label>
					</div>
					<div class="col-sm-6 input-column">
						<input class="form-control" type="text">
					</div>
				</div>
				<div class="form-row form-group">
					<div class="col-sm-4 label-column">
						<label class="col-form-label" for="name-input-field">Cognome</label>
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
						<label class="col-form-label" for="name-input-field">Citta'�</label>
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
						<label class="col-form-label" for="name-input-field">Cod. Fiscale</label>
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
				�Copyright 2019</p>
			<!-- End: Copyright -->
		</footer>
	</div>
	<!-- End: Footer Basic -->
	<!-- Start: Projects Clean -->
	<div class="projects-clean"></div>
	<!-- End: Projects Clean -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
	<script src="assets/js/scriptHome.min.js"></script>
</body>
</html>