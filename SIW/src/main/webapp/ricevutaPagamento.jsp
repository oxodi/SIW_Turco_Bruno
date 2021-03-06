<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="assets/js/jquery.min.js"></script>

<link rel="stylesheet" href="assets/css/Pagamento.css">



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

	<div class="container"
		style="border-style: solid; border-radius: 25px; border-color: green; min-height: 500px;">
		<img src="assets/img/ricevutaPagamento.png" alt="ricevuta" id="center">	
		<h1 align="center" id="titolo">PAGAMENTO AVVENUTO CON SUCCESSO!</h1>
		<div class="container" align="center" style="margin-top: 5%">
			<a href="Login?logout=false" class="button">OK! </a>
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