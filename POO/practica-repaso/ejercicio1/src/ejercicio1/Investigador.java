package ejercicio1;

public class Investigador {
	private String nombre;
	private int categoria;
	private String especialidad;
	private Subsidio subsidios[] = new Subsidio[5];
	private int subsidiosDiml;
	
	public Investigador(String nombreP, int categoriaP, String especialidadP) {
		nombre = nombreP;
		categoria = categoriaP;
		especialidad = especialidadP;
		subsidiosDiml = 0;
	}
	
	public void agregarSubsidio(Subsidio subsidioP) {
		if(subsidiosDiml<5) {
			subsidios[subsidiosDiml] = subsidioP;
			subsidiosDiml++;
		}
	}
	
	public double totalSubsidios() {
		double resultado = 0;
		for(int i=0;i<subsidiosDiml;i++) {
			if(subsidios[i].getOtorgado()) {
				resultado += subsidios[i].getMonto();
			}
		}
		return resultado;
	}

	public Subsidio[] getSubsidios() {
		return subsidios;
	}

	public void setSubsidios(Subsidio[] subsidios) {
		this.subsidios = subsidios;
	}

	public String getNombre() {
		return nombre;
	}

	public int getSubsidiosDiml() {
		return subsidiosDiml;
	}
	
	public String datos() {
		return this.nombre + " " + this.categoria + " " + this.especialidad + " Total: " + this.totalSubsidios(); 
	}
	
}
