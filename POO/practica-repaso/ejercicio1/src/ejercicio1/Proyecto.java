package ejercicio1;

public class Proyecto {
	private String nombre;
	private int codigo;
	private String director;
	private Investigador investigadores[] = new Investigador[50];
	private int investigadoresDiml;
	
	public Proyecto(String nombreP, int codigoP, String directorP) {
		nombre = nombreP;
		codigo = codigoP;
		director = directorP;
		investigadoresDiml = 0;
	}
	
	public void agregarInvestigador(Investigador investigadorP) {
		if (investigadoresDiml < 50) {
			investigadores[investigadoresDiml] = investigadorP;
			investigadoresDiml++;
		}
	}
	
	public void otogarTodos(String nombreP) {
		boolean encontro = false;
		int i = 0;
		while(i < investigadoresDiml && !encontro) {
			if(investigadores[i].getNombre().equals(nombreP)) {
				encontro = true;
			}
			else {
				i++;
			}
		}
		if(encontro) {
			Subsidio subsidios[] = investigadores[i].getSubsidios();
			int diml = investigadores[i].getSubsidiosDiml();
			for(int j=0;j<diml;j++) {
				if(!subsidios[j].getOtorgado()) {
					subsidios[j].setOtorgado(true);
				}
			}
			investigadores[i].setSubsidios(subsidios);
		}
	}
	public double total() {
		double total = 0;
		for(int i=0;i<investigadoresDiml;i++) {
			total = investigadores[i].totalSubsidios();
		}
		return total;
	}
	
	private String informacionInvestigadores() {
		String retorno = "";
		for(int i=0;i<investigadoresDiml;i++) {
			retorno += investigadores[i].datos() + "\n";
		}
		return retorno;
	}
	public String toString() {
		return this.nombre+" "+
				this.codigo+" "+
				this.director+"\n"+
				"Monto total: "+this.total()+"\n"+
				this.informacionInvestigadores();
	}
}
