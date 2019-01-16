package persistence.dao;

import java.util.List;

import entita.ortaggio.Ortaggio;

public interface OrtaggioDao {
	
	public void salva(Ortaggio ortaggio);

	public Ortaggio cercaPerChiavePrimaria(int id);

	public List<Ortaggio> cercaTutti();

	public void aggiorna(Ortaggio ortaggio);

	public void cancella(Ortaggio ortaggio);
}