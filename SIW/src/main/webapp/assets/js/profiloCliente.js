//function Cliente(id, citta, provincia, cap, indirizzo, telefono){
//this.id = id;
//this.citta = citta;
//this.provincia = provincia;
//this.cap = cap;
//this.indirizzo = indirizzo;
//this.telefono = telefono;
//}

function aggiornaDati(idCliente){

	var cliente = {
			id : idCliente,
			citta : $('#citta').val(),
			provincia : $('#provincia').val(),
			cap : $('#cap').val(),
			indirizzo : $('#indirizzo').val(),
			telefono : $('#telefono').val()
	};


	$.ajax({
		type: "POST",
		url: "aggiornaDatiCliente",
		datatype: "json",
		data: JSON.stringify(cliente),
		success: function(data){
			var clienteRicevuto = JSON.parse(data);

			$("#provincia").text(clienteRicevuto.provincia);
			$("#cap").text(clienteRicevuto.cap);
			$("#citta").text(clienteRicevuto.citta);
			$("#indirizzo").text(clienteRicevuto.indirizzo);
			$("#telefono").text(clienteRicevuto.telefono);

			$("#tel").html("<strong>Telefono</strong> "+ clienteRicevuto.telefono);
			$("#cit").html("<strong>Città</strong> "+ clienteRicevuto.citta +"("+clienteRicevuto.provincia+")");
			$("#indi").html("<strong>Indirizzo</strong> "+ clienteRicevuto.indirizzo +" ("+ clienteRicevuto.cap+")");

			$('#modalSuccess').modal('show');	
		}

	});

}



function dammiPrenotazioni(){

	$('#prenotazioni').empty();
	
	var $table = (" <div class='table-responsive' id='terreni'>" +
					"<table class='table table-hover' id='listaPrenotazioni'>" +
					"<thead style='background: #f7d08c'>" +
					"<tr>" +
					"<th>Azienda</th>" +
					"<th>Terreno</th>" +
					"<th>Locazione</th>" +
					"<th>Dettagli</th>" +
					"</tr>" +
					"</thead>" +
					"</table>" +
					"</div>")
					
					
	$("#prenotazioni").append($table);
	
	
	var $loading = ('<div class="container-fluid" align="center" id="loading">'
			+ '<div class="loader" role="status" >' + '</div>' + '</div>')
	$("#prenotazioni").append($loading);
	
	$.ajax({
		type: "GET",
		url: "DammiPrenotazioniCliente?edit=tabPren",
		data6type: "json",
		
		error : function() {
			alert("si è verificato un errore");
		},
		success: function(data){
			
			var terreniPrenotati = JSON.parse(data);
			alert("sono nell' ajax");
			for (var i = 0; i < terreniPrenotati.length; i++){
				
				var $row = ("<tbody id='item' style='background: #f4ddb5'>" +
							"<tr class='clickable' data-toggle='collapse'" +
							"data-target='#group-of-rows-1' aria-expanded='false'" +
							"aria-controls='group-of-rows-1'> " +
							"<td>"+terreniPrenotati[i].idTerreno+"</td>" +
							"<td>"+terreniPrenotati[i].locazione+"</td>" +
							"<td>"+terreniPrenotati[i].azienda+"</td>" +
							"<td><a><i class='fa fa-info-circle' aria-hidden='true' style='font-size: 25px; color: #136000' onclick='mostraOrtaggi("+terreniPrenotati[i].idTerreno+","+terreniPrenotati[i].periodi+")'></i></a></td>" +
							"</tr>" +
							"</tbody>" +
							"<tbody id='group-of-rows-1"+terreniPrenotati[i].idTerreno+"' class='collapse'> " + 
							"</tbody>")
							
				$("#listaPrenotazioni").append($row);			
			}
			$("#loading").remove();
//			mostraOrtaggi("44","autunno");
		}
	
	});
	
}





function mostraOrtaggi(idTerreno, periodoColtivazione){
	
	alert("sono in mostra ortaggi");
	$.ajax({
		type: "GET",
		url: "DammiPrenotazioniCliente?edit=false&id_terreno="+idTerreno,
		datatype: "json",
		success: function(data){

			var ortaggiPrenotati = JSON.parse(data);
			var periodo = periodoColtivazione;
			var groupRows = document.getElementById("group-of-rows-1"+idTerreno);
			
			
			$(groupRows).empty();
			
			
			var rowIndex = "<tr>"
								+"		<td><strong>Data</strong></td> "
								+"		<td><strong>Ortaggio</strong></td>"
								+"		<td><strong>Quantità</strong></td>"
								+"		<td><strong>Progresso Coltivazione</strong></td>"
								+	"</tr>";
			
			$(groupRows).append(rowIndex);
			
			for(i = 0; i < ortaggiPrenotati.length;i++)
			{		
				
				if(ortaggiPrenotati[i].serra === "si")
					var serra = " (serra)";
				else
					var serra = "";
				
				if(ortaggiPrenotati[i].nome == "Terreno"){
				
					var $row = $("<tr>"+ 
							"<td>"+ortaggiPrenotati[i].date+"</td> " +
							"<td>"+ortaggiPrenotati[i].nome+"</td> " +
							"<td>"+ortaggiPrenotati[i].quantita + serra + "</td> " +
							"<td>"+periodo+"</td>" +
							"</tr>"
						
					);

				}
				else{
					var $row = $("<tr>"+ 
							"<td>"+ortaggiPrenotati[i].date+"</td> " +
							"<td>"+ortaggiPrenotati[i].nome+"</td> " +
							"<td>"+ortaggiPrenotati[i].quantita + serra + "</td> " +
							"<td> <div class='progress'>" +
							"<div class='progress-bar bg-success'style='width:"+ortaggiPrenotati[i].progresso+"%'>"+ortaggiPrenotati[i].progresso+"%</div"+
							+"</div>"+
							"</td> " +
							"</tr>"
						
					);
					
					
					
				}
				
				$(groupRows).append($row);

			}	
	
			$(groupRows).collapse("toggle");
		}

	});

 
}

function dammiAcquisti(){
	alert("sono in dammi acquisti");
	$('#acquisti').empty();
	
	var $table = (" <div class='table-responsive' id='acquistiTable'>" +
					"<table class='table table-striped table-hover'>" +
					"<thead style='background: #f7d08c'>" +
					"<tr>" +
					"<th>Ordine</th>" +
					"<th>Data</th>" +
					"<th>Prodotto</th>" +
					"<th>Quantità</th>" +
					"<th>Importo</th>" +
					"<th>Stato</th>" +
					"</tr>" +
					"</thead>" +
					"<tbody id='tabAcquisti' style='background: #f4ddb5'>" +
					"</tbody>" +
					"</table>" +
					"</div>")
					
					
	$("#acquisti").append($table);
	
					
	var $loading = ('<div class="container-fluid" align="center" id="loading">'
			+ '<div class="loader" role="status" >' + '</div>' + '</div>')
	$("#acquisti").append($loading);


	$.ajax({
		type: "GET",
		url: "DammiAcquistiCliente",
		datatype: "json",
		
		error : function() {
			alert("si è verificato un errore");
		},
		success: function(data){

			var acquisti = JSON.parse(data);
			
			for (var i = 0; i < acquisti.length; i++){
				var $row = ("<tr>" +
							"<td> N° " +acquisti[i].idOrdine+ "</td>"+
							"<td>" +acquisti[i].date+ "</td>" +
							"<td>" +acquisti[i].nome+ "</td>" +
							"<td>" +acquisti[i].quantita+ "</td>" +
							"<td> € " +acquisti[i].importo+ "</td>"+
			 				"<td>" +acquisti[i].stato+ "</td>"+
							"</tr>")
				$("#tabAcquisti").append($row);				
			}		
			$("#loading").remove();
		}
	});
}	