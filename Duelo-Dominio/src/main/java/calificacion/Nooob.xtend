package calificacion

import juego.Estadisticas

class Nooob extends Calificacion {
	
	/*
	Noob:
	Es en cualquier caso
	*/
	
	new(){
		super("Nooob",5)
	}
	
	override puedeActualizar(Estadisticas estadisticas) {
		return true
	}
}