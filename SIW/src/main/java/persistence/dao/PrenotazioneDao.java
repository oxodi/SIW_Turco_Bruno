package persistence.dao;

import java.util.Date;
import java.util.List;

import entita.Prenotazione;

public interface PrenotazioneDao {

	public void salva(Prenotazione prenotazione);

	public List<Prenotazione> cercaPerData(Date data);

	public List<Prenotazione> cercaPerCliente(int idCliente);

	public List<Prenotazione> cercaPerTerreno(int idTerreno);
	
	public List<Prenotazione> cercaPerClienteTerreno(int idCliente, int idTerreno);

	public List<Prenotazione> cercaTutti();
	
	public int tempoColtivazionePerTerrenoOrtaggio(int idTerreno, int idOrtaggio);

	public void cancella(Prenotazione prenotazione);
	
	
}
