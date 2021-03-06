package persistence.dao;

import java.util.List;

import entita.Cliente;

public interface ClienteDao {
	public void salva(Cliente cliente);

	public Cliente cercaPerChiavePrimaria(int id);

	public Cliente cercaPerEmail(String email);
	
	public List<Cliente> cercaTutti();

	public void aggiorna(Cliente cliente);

	public void cancella(Cliente cliente);

	public void setPassword(Cliente cliente, String password);
	
	public boolean checkCliente(String email, String password);
	
}
