package ejercicio1;

public class Subsidio {
	private double monto;
	private String motivo;
	private boolean otorgado;
	
	public Subsidio(double montoP, String motivoP) {
		monto = montoP;
		motivo = motivoP;
		otorgado = false;
	}

	public double getMonto() {
		return monto;
	}

	public boolean getOtorgado() {
		return otorgado;
	}

	public void setOtorgado(boolean otorgado) {
		this.otorgado = otorgado;
	}
	
	
	
}
