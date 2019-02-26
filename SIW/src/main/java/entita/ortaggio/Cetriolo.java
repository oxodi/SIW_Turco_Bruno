package entita.ortaggio;

public class Cetriolo extends Ortaggio {

	public Cetriolo() {
		this.setId(3);
		this.setNome("Cetriolo");
		this.setResa(4.0);
		this.setPeriodoColtivazione("estate");
	}

	public Cetriolo(double prezzo, int id_terreno, int tempoColtivazione, String periodoColtivazione) {
		super(prezzo, id_terreno, tempoColtivazione);
		this.setId(3);
		this.setNome("Cetriolo");
		this.setResa(1.0);
		this.setPeriodoColtivazione("estate");
	}
}
