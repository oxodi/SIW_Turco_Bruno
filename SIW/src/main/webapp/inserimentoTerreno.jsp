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

<link rel="stylesheet" href="assets/css/registration.min.css">
<link rel="stylesheet" href="assets/css/inserimentoTerreno.css">
<script src="assets/js/jquery.min.js"></script>
<!-- Script for load Navigation Bar -->
<script>
	$(function() {
		$("#navbar").load("navBarAreaAziende.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
<script>
	function validazioneDati() {
		$("#validazioneLocazione").text($("#locazione").val());
		$("#validazioneDim").text($("#dimensione_terreno").val());
		$("#validazioneDimSerra").text($("#dimensione_serra").val());
		$("#validazioneCosto").text($("#costo_terreno").val());
		$("#validazioneDisponibilita").text($("#disponibilita").val());
		
		var isCompleto = document.getElementById("completo").checked;
		if(isCompleto){
		$("#validazioneServizioCompleto").text("SI");
		}
		else{
			$("#validazioneServizioCompleto").text("NO");
		}
		var isParziale = document.getElementById("parziale").checked;
		if(isParziale){
		$("#validazioneServizioParziale").text("SI");
		}
		else{
			$("#validazioneServizioParziale").text("NO");
		}
		$('#tabellaValidazioneOrtaggi> tbody').empty();
		$('#tabella').find('input[type="checkbox"]:checked').each(function () {
	        var riga = $(this).val();
	        var $row = $('<tr>'+
				      '<th>'+$('#nome'+riga).text()+'</th>'+
				      '<th>'+$('#prezzo'+riga).val()+'</th>'+
				      '<th>'+$('#resa'+riga).text()+'</th>'+
				      '<th>'+$('#tempo'+riga).val()+'</th>'+
				      '</tr>'
				);
				$('#tabellaValidazioneOrtaggi> tbody:last').append($row);
		});
		
	};
</script>
<script>
	$(document).ready(function() {
		$("#avanti").click(function() {
			$("#inserimento").hide("slow");
			$("#inserimento_file").show("slow");
			validazioneDati();

		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#indietro").click(function() {
			$("#inserimento_file").hide("slow");
			$("#inserimento").show("slow");

		});
	});
</script>

</head>

<body>
	<!-- Start: Navigation with Button -->
	<div id="navbar"></div>
	<!-- End: Navigation with Button -->
	<div class="row register-form" style="width: 100%">
		<div class="col-md-10 offset-md-1">
			<form class="custom-form" method="post"
				action="TerrenoOspitaOrtaggi?edit=false">

				<div id="inserimento">
					<h1>Inserimento Terreno</h1>
					<div class="row">
						<!-- colonna 1  -->
						<div class="col-md-6 ">
							<div class="form-row form-group">
								<div class="col-md-4" align="left">
									<label class="label-column">Locazione</label>
								</div>
								<div class="col-xs-2">
									<input class="input-column" type="text" name="locazione"
										id="locazione" placeholder="">
								</div>
							</div>

							<div class="form-row form-group">
								<div class="col-md-4" align="left">
									<label class="label-column">Dimensione Terreno (mt²)</label>
								</div>
								<div class="col-xs-2">
									<input class="input-column" type="text"
										name="dimensione_terreno" id="dimensione_terreno"
										placeholder="">
								</div>
							</div>

							<div class="form-row form-group">
								<div class="col-md-4" align="left">
									<label class="label-column">Dimensione Serra (mt²)</label>
								</div>
								<div class="col-xs-2">
									<input class="input-column" type="text" name="dimensione_serra"
										id="dimensione_serra" placeholder="">
								</div>
							</div>

							<div class="form-row form-group">
								<div class="col-md-4" align="left">
									<label class="label-column">Costo Terreno (€/mt²)</label>
								</div>
								<div class="col-xs-2">
									<input class="input-column" type="text" name="costo_terreno"
										id="costo_terreno" placeholder="">
								</div>
							</div>
							<div class="form-row form-group">
								<div class="col-md-4" align="left">
									<label class="label-column">Periodo Disponibilita'</label>
								</div>
								<div class="col-xs-2 ">
									<!-- <input class="input-column" type="text" name="disponibilita"
									placeholder=""> -->
									<select class="custom-select input-column"
										style="width: 190px; padding: 5px;" name="disponibilita"
										id="disponibilita">
										<option value="primavera">Primavera</option>
										<option value="estate">Estate</option>
										<option value="autunno">Autunno</option>
										<option value="inverno">Inverno</option>
										<!-- <option value="annuale">Annuale</option>  -->

									</select>

								</div>
							</div>
							<div class="form-row form-group">

								<label class="label-column"><strong>Seleziona i
										sevizi</strong></label>

							</div>
							<div class="form-check" align="left">
								<input type="checkbox" name="parziale" id="parziale"><label>
									Servizio Parziale</label>
							</div>
							<br>
							<div class="form-check" align="left">
								<input type="checkbox" name="completo" id="completo"><label>
									Servizio Completo</label>
							</div>

						</div>
						<!-- fine colonna 1 -->
						<!-- colonna 2 -->
						<div class="col-md-6 ">
							<div class="form-row form-group" align="center">
								<label><strong>selezionare gli ortaggi
										coltivabili e inserisci il relativo costo</strong></label>
							</div>
							<div class="form-row form-group">
								<div class="table-responsive" id="table-scroll">
									<table class="table table-hover" id="tabella">
										<thead>
											<tr>
												<th></th>
												<th><strong>Nome</strong></th>
												<th><strong>Resa</strong></th>
												<th><strong>Prezzo (€/mt²)</strong></th>
												<th><strong>Tempo Coltivazione (giorni)</strong></th>

											</tr>
										</thead>
										<tbody id="items">
											<c:forEach items="${ortaggi}" var="o">
												<tr class="accordion-toggle" data-toggle="collapse">
													<td><input type="checkbox" value="${o.id}"
														name="ortaggiSelezionati"></td>
													<td id="nome${o.id}">${o.nome}</td>
													<td id="resa${o.id }">${o.resa}</td>
													<td><input class="input-column" type="text"
														style="max-width: 80px" name="prezzo${o.id}" id="prezzo${o.id}"
														placeholder="prezzo"></td>
													<td><input class="input-column" type="text"
														style="max-width: 80px" name="tempo${o.id}" id="tempo${o.id}"
														placeholder="giorni"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- fine colonna 2 -->
						<div class="container">
							<div align="center">
								<button class="button btn" data-toggle="modal"
									data-target="#modalAnnullamento" type="button">Annulla</button>

								<button class="button btn" id="avanti" type="button"
									style="word-spacing: 4px">Avanti ▶</button>

							</div>
						</div>
					</div>
				</div>
				<div class="container" id="inserimento_file" style="display: none">
					<!--<div class="table">
						 <input type="text" id="validazioneLocazione"> <input
							type="text" id="validazioneDim"> <input type="text"
							id="validazioneDimSerra"> <input type="text"
							id="validazioneCosto"> 
					</div>
					-->
					<h5>
						<strong>Controllare i dati inseriti, se si è sicuri, confermare l'inserimento</strong>
					</h5>
					<br>
					<div class="table-responsive">
					<table class="table" id="valid">
						<thead class="thead-dark" style="boreder-radius: 15px">
							<tr>
								<th scope="col">Locazione</th>
								<th scope="col">Dimensione (mt²)</th>
								<th scope="col">Dimensione Serra (mt²)</th>
								<th scope="col">Costo (€/mt²)</th>
								<th scope="col">Periodo Disponibilità</th>
								<th scope="col">Servizio Completo </th>
								<th scope="col">Servizio Parziale </th> 
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="input" id="validazioneLocazione" scope="row"> </td>
								<td class="input" id="validazioneDim" scope="row"> </td>
								<td class="input" id="validazioneDimSerra" scope="row"> </td>
								<td class="input" id="validazioneCosto" scope="row"></td>
								<td class="input" id="validazioneDisponibilita" scope="row"> </td>
								<td class="input" id="validazioneServizioCompleto" scope="row"> </td>
								<td class="input" id="validazioneServizioParziale" scope="row"> </td>
							</tr>
						</tbody>
					</table>
					</div>
					<br>
					<div class="table-responsive">
					<table class="table" id="tabellaValidazioneOrtaggi">
						<thead class="thead-dark" style="boreder-radius: 15px">
							<tr>
								<th scope="col">Ortaggi selezionati</th>
								<th scope="col">Costo unitario (€/mt²)</th>
								<th scope="col">Resa</th>
								<th scope="col">Tempo Coltivazione (giorni)</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					</div>
					<br>
					<div class="container-fluid" align="center">
					<h5>
						<strong>Inserire un documento di proprieta' del terreno</strong>
					</h5>
					<input type="file" style="margin-left: -3px" name="file"
						class="text-center center-block file-upload container-fluid button">
					</div>
					<div align="center">

						<button class="button btn" id="indietro" type="button"
							style="word-spacing: 4px">◀ Indietro</button>


						<button class="button btn" type="submit">Conferma</button>

					</div>
				</div>
			</form>
		</div>
		<div id="modalAnnullamento" class="modal fade" role="dialog"
			style="z-index: 2500; border-radius: 25px">

			<div class="modal-dialog" style="border: 2px green solid">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Conferma Annullamento</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p>Sei sicuro di voler annullare l'inserimento?</p>
					</div>
					<div class="modal-footer">

						<div class="container" align="right">
							<button type="button" class="btn " data-dismiss="modal"
								style="border-radius: 15px">NO</button>
							<a href="PageLoader?id=backendAzienda"><button type="button"
									class="btn btn-success" style="border-radius: 15px">SI</button>
							</a>
						</div>
					</div>
				</div>

			</div>
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