package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import entita.Acquisto;
import persistence.dao.AcquistoDao;

public class AcquistoDaoJDBC implements AcquistoDao {

	private DataSource dataSource;

	public AcquistoDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void salva(Acquisto acquisto) {
		Connection connection = this.dataSource.getConnection();

		try {
			int id = GestoreID.getId(connection, "acquisto_id_seq", "acquisto");
			acquisto.setId(id);

			String insert = "INSERT INTO acquisto(id, id_cliente, id_prodotto, data_acquisto,"
					+ " quantita, importo) VALUES (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);

			statement.setInt(1, acquisto.getId());
			statement.setInt(2, acquisto.getIdCliente());
			statement.setInt(3, acquisto.getIdProdotto());

			long secsAcquisto = acquisto.getDataAcquisto().getTime();
			
			statement.setDate(4, new java.sql.Date(secsAcquisto));
			statement.setInt(5, acquisto.getQuantita());
			statement.setDouble(6, acquisto.getImporto());
			
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
	public void aggiorna(Acquisto acquisto) {
		Connection connection = this.dataSource.getConnection();
		try {

			String update = "UPDATE acquisto SET id_cliente = ?, id_prodotto = ?, data_acquisto = ?, quantita = ?, importo = ? WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(update);

			statement.setInt(1, acquisto.getId());
			statement.setInt(2, acquisto.getIdCliente());
			statement.setInt(3, acquisto.getIdProdotto());

			long secsAcquisto = acquisto.getDataAcquisto().getTime();
			statement.setDate(4, new java.sql.Date(secsAcquisto));
			statement.setInt(5, acquisto.getQuantita());
			statement.setDouble(6, acquisto.getImporto());
			
			
			statement.executeUpdate();

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e2) {
				throw new PersistenceException(e2.getMessage());
			}
		}
	}

	@Override
	public void cancella(Acquisto acquisto) {
		Connection connection = this.dataSource.getConnection();
		try {

			String delete = "DELETE FROM studente WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);

			statement.setInt(1, acquisto.getId());
			statement.executeUpdate();

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e2) {
				throw new PersistenceException(e2.getMessage());
			}
		}
	}

	@Override
	public Acquisto cercaPerChiavePrimaria(int id) {
		Connection connection = this.dataSource.getConnection();
		Acquisto acquisto = null;
		try {
			String query = "SELECT * FROM acquisto WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(query);

			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();

			if (result.next()) {

				acquisto = new Acquisto();
				acquisto.setId(result.getInt("id"));
				acquisto.setIdCliente(result.getInt("id_cliente"));
				acquisto.setIdProdotto(result.getInt("id_prodotto"));

				long secsAcquisto = result.getDate("data_acquisto").getTime();
			
				acquisto.setDataAcquisto(new java.util.Date(secsAcquisto));
				acquisto.setQuantita(result.getInt("quantita"));
				acquisto.setImporto(result.getDouble("importo"));
				

			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e2) {
				throw new PersistenceException(e2.getMessage());
			}
		}

		return acquisto;
	}

	@Override
	public List<Acquisto> cercaPerCliente(int idCliente) {
		Connection connection = this.dataSource.getConnection();
		List<Acquisto> acquisti = new LinkedList<Acquisto>();

		try {
			Acquisto acquisto;
			PreparedStatement statement;
			String query = "SELECT * FROM acquisto where id_cliente = ?";

			statement = connection.prepareStatement(query);
			statement.setInt(1, idCliente);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				acquisto = new Acquisto();
				acquisto.setId(result.getInt("id"));
				acquisto.setIdCliente(result.getInt("id_cliente"));
				acquisto.setIdProdotto(result.getInt("id_prodotto"));

				long secsAcquisto = result.getDate("data_acquisto").getTime();

				acquisto.setDataAcquisto(new java.util.Date(secsAcquisto));
				acquisto.setQuantita(result.getInt("quantita"));
				acquisto.setImporto(result.getDouble("importo"));
				

				acquisti.add(acquisto);
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
		return acquisti;
	}

	@Override
	public List<Acquisto> cercaPerProdotto(int idProdotto) {
		Connection connection = this.dataSource.getConnection();
		List<Acquisto> acquisti = new LinkedList<Acquisto>();

		try {
			Acquisto acquisto;
			PreparedStatement statement;
			String query = "SELECT FROM acquisto where id_prodotto = ?";

			statement = connection.prepareStatement(query);
			statement.setInt(3, idProdotto);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				acquisto = new Acquisto();
				acquisto.setId(result.getInt("id"));
				acquisto.setIdCliente(result.getInt("id_cliente"));
				acquisto.setIdProdotto(result.getInt("id_prodotto"));

				long secsAcquisto = result.getDate("data_acquisto").getTime();
				
				acquisto.setDataAcquisto(new java.util.Date(secsAcquisto));
				acquisto.setQuantita(result.getInt("quantita"));
				acquisto.setImporto(result.getDouble("importo"));
				
				
				acquisti.add(acquisto);
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
		return acquisti;
	}

	@Override
	public List<Acquisto> cercaPerDataAcquisto(Date dataAcquisto) {
		Connection connection = this.dataSource.getConnection();
		List<Acquisto> acquisti = new LinkedList<Acquisto>();

		try {
			Acquisto acquisto;
			PreparedStatement statement;
			String query = "SELECT * FROM acquisto WHERE data_acquisto = ?";

			statement = connection.prepareStatement(query);
			statement.setDate(4, (java.sql.Date) dataAcquisto);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				acquisto = new Acquisto();
				acquisto.setId(result.getInt("id"));
				acquisto.setIdCliente(result.getInt("id_cliente"));
				acquisto.setIdProdotto(result.getInt("id_prodotto"));

				long secsAcquisto = result.getDate("data_acquisto").getTime();
				
				acquisto.setDataAcquisto(new java.util.Date(secsAcquisto));
				acquisto.setQuantita(result.getInt("quantita"));
				acquisto.setImporto(result.getDouble("importo"));
				

				acquisti.add(acquisto);
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
		return acquisti;
	}

	@Override
	public List<Acquisto> cercaTutti() {
		Connection connection = this.dataSource.getConnection();
		List<Acquisto> acquisti = new LinkedList<Acquisto>();

		try {
			Acquisto acquisto;
			PreparedStatement statement;
			String query = "SELECT * FROM acquisto";

			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();

			while (result.next()) {

				acquisto = new Acquisto();
				acquisto.setId(result.getInt("id"));
				acquisto.setIdCliente(result.getInt("id_cliente"));
				acquisto.setIdProdotto(result.getInt("id_prodotto"));

				long secsAcquisto = result.getDate("data_acquisto").getTime();
				
				acquisto.setDataAcquisto(new java.util.Date(secsAcquisto));
				acquisto.setQuantita(result.getInt("quantita"));
				acquisto.setImporto(result.getDouble("importo"));
				
				
				acquisti.add(acquisto);
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
		return acquisti;
	}

}
