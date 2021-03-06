package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import entita.Prenotazione;
import persistence.dao.PrenotazioneDao;

public class PrenotazioneDaoJDBC implements PrenotazioneDao {

	private DataSource dataSource;

	public PrenotazioneDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void salva(Prenotazione prenotazione) {
		Connection connection = this.dataSource.getConnection();

		try {

				String insert = "INSERT INTO prenotazione(id_cliente, id_terreno, id_ortaggio, quantita, data, serra, nome_cliente, cognome_cliente,"
						+ "locazione_terreno, nome_ortaggio) VALUES (?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement statement = connection.prepareStatement(insert);

				statement.setInt(1, prenotazione.getIdCliente());
				statement.setInt(2, prenotazione.getIdTerreno());
				statement.setInt(3, prenotazione.getId_ortaggio());
				statement.setInt(4, prenotazione.getQuantita());
				long secs = prenotazione.getDataPrenotazione().getTime();
				statement.setDate(5, new java.sql.Date(secs));
				statement.setBoolean(6, prenotazione.isSerra());
				statement.setString(7, prenotazione.getNomeCliente());
				statement.setString(8, prenotazione.getCognomeCliente());
				statement.setString(9, prenotazione.getLocazioneTerreno());
				statement.setString(10, prenotazione.getNomeOrtaggio());
				
				statement.executeUpdate();
			

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public List<Prenotazione> cercaPerData(Date data) {
		Connection connection = this.dataSource.getConnection();
		List<Prenotazione> prenotazioni = new LinkedList<Prenotazione>();

		try {
			Prenotazione prenotazione;
			PreparedStatement statement;
			String query = "SELECT * FROM prenotazione WHERE data = ?";

			statement = connection.prepareStatement(query);
			statement.setDate(1, (java.sql.Date) data);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				prenotazione = new Prenotazione();
				prenotazione.setIdCliente(result.getInt("id_cliente"));
				prenotazione.setIdTerreno(result.getInt("id_terreno"));
				prenotazione.setId_ortaggio(result.getInt("id_ortaggio"));
				prenotazione.setQuantita(result.getInt("quantita"));
				long secs = result.getDate("data").getTime();
				prenotazione.setDataPrenotazione(new java.util.Date(secs));
				prenotazione.setSerra(result.getBoolean("serra"));
				prenotazione.setNomeCliente(result.getString("nome_cliente"));
				prenotazione.setCognomeCliente(result.getString("cognome_cliente"));
				prenotazione.setLocazioneTerreno(result.getString("locazione_terreno"));
				prenotazione.setNomeOrtaggio(result.getString("nome_ortaggio"));
				
				
				prenotazioni.add(prenotazione);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return prenotazioni;
	}

	@Override
	public void cancella(Prenotazione prenotazione) {
		Connection connection = this.dataSource.getConnection();

		try {
			String delete = "DELETE FROM prenotazione WHERE id_cliente = ? AND id_terreno = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);

			statement.setInt(1, prenotazione.getIdCliente());
			statement.setInt(2, prenotazione.getIdTerreno());

			statement.executeUpdate();

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public List<Prenotazione> cercaPerCliente(int idCliente) {
		Connection connection = this.dataSource.getConnection();
		List<Prenotazione> prenotazioni = new LinkedList<Prenotazione>();

		try {
			Prenotazione prenotazione;
			PreparedStatement statement;
			String query = "SELECT id_terreno, id_cliente FROM prenotazione WHERE id_cliente = ? GROUP BY id_terreno, id_cliente" ;

			statement = connection.prepareStatement(query);
			statement.setInt(1, idCliente);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				prenotazione = new Prenotazione();
				prenotazione.setIdCliente(result.getInt("id_cliente"));
				prenotazione.setIdTerreno(result.getInt("id_terreno"));
		
				prenotazioni.add(prenotazione);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
				
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return prenotazioni;
	}

	@Override
	public List<Prenotazione> cercaPerTerreno(int idTerreno) {
		Connection connection = this.dataSource.getConnection();
		List<Prenotazione> prenotazioni = new LinkedList<Prenotazione>();

		try {
			Prenotazione prenotazione;
			PreparedStatement statement;
			String query = "SELECT * FROM prenotazione WHERE id_terreno = ?";

			statement = connection.prepareStatement(query);
			statement.setInt(1, idTerreno);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				prenotazione = new Prenotazione();
				prenotazione.setIdCliente(result.getInt("id_cliente"));
				prenotazione.setIdTerreno(result.getInt("id_terreno"));
				prenotazione.setId_ortaggio(result.getInt("id_ortaggio"));
				prenotazione.setQuantita(result.getInt("quantita"));
				long secs = result.getDate("data").getTime();
				prenotazione.setDataPrenotazione(new java.util.Date(secs));
				prenotazione.setSerra(result.getBoolean("serra"));
				prenotazione.setNomeCliente(result.getString("nome_cliente"));
				prenotazione.setCognomeCliente(result.getString("cognome_cliente"));
				prenotazione.setLocazioneTerreno(result.getString("locazione_terreno"));
				prenotazione.setNomeOrtaggio(result.getString("nome_ortaggio"));
				
				prenotazioni.add(prenotazione);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return prenotazioni;
	}

	@Override
	public List<Prenotazione> cercaTutti() {
		Connection connection = this.dataSource.getConnection();
		List<Prenotazione> prenotazioni = new LinkedList<Prenotazione>();

		try {
			Prenotazione prenotazione;
			PreparedStatement statement;
			String query = "SELECT * FROM prenotazione";

			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				prenotazione = new Prenotazione();
				prenotazione.setIdCliente(result.getInt("id_cliente"));
				prenotazione.setIdTerreno(result.getInt("id_terreno"));
				prenotazione.setId_ortaggio(result.getInt("id_ortaggio"));
				prenotazione.setQuantita(result.getInt("quantita"));
				long secs = result.getDate("data").getTime();
				prenotazione.setDataPrenotazione(new java.util.Date(secs));
				prenotazione.setSerra(result.getBoolean("serra"));
				prenotazione.setNomeCliente(result.getString("nome_cliente"));
				prenotazione.setCognomeCliente(result.getString("cognome_cliente"));
				prenotazione.setLocazioneTerreno(result.getString("locazione_terreno"));
				prenotazione.setNomeOrtaggio(result.getString("nome_ortaggio"));
				
				prenotazioni.add(prenotazione);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return prenotazioni;
	}

	@Override
	public List<Prenotazione> cercaPerClienteTerreno(int idCliente, int idTerreno) {
		Connection connection = this.dataSource.getConnection();
		List<Prenotazione> prenotazioni = new LinkedList<Prenotazione>();
		
		try {
			Prenotazione prenotazione;
			PreparedStatement statement;
			String query = "SELECT * FROM prenotazione WHERE id_cliente = ? AND id_terreno = ?";

			statement = connection.prepareStatement(query);
			statement.setInt(1, idCliente);
			statement.setInt(2, idTerreno);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				prenotazione = new Prenotazione();
				prenotazione.setIdCliente(result.getInt("id_cliente"));
				prenotazione.setIdTerreno(result.getInt("id_terreno"));
				prenotazione.setId_ortaggio(result.getInt("id_ortaggio"));
				prenotazione.setQuantita(result.getInt("quantita"));
				long secs = result.getDate("data").getTime();
				prenotazione.setDataPrenotazione(new java.util.Date(secs));
				prenotazione.setSerra(result.getBoolean("serra"));
				prenotazione.setNomeCliente(result.getString("nome_cliente"));
				prenotazione.setCognomeCliente(result.getString("cognome_cliente"));
				prenotazione.setLocazioneTerreno(result.getString("locazione_terreno"));
				prenotazione.setNomeOrtaggio(result.getString("nome_ortaggio"));
			
				prenotazioni.add(prenotazione);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return prenotazioni;
	}

	@Override
	public int tempoColtivazionePerTerrenoOrtaggio(int idTerreno, int idOrtaggio) {
		Connection connection = this.dataSource.getConnection();
		int tempoColtivazione = 0;
		
		try {
		
			PreparedStatement statement;
			String query = "SELECT * FROM ospita WHERE id_terreno = ? AND id_ortaggio = ?";
		
			statement = connection.prepareStatement(query);
			statement.setInt(1, idTerreno);
			statement.setInt(2, idOrtaggio);
			
			ResultSet result = statement.executeQuery();

			if(result.next()) {

				tempoColtivazione = result.getInt("tempo_coltivazione");
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return tempoColtivazione;
	}

}
