package calificacion

import java.util.Random
import juego.Personaje

class Manco extends Calificacion {
	
	new(){
		super(15)
	}
	
	override actualizar(Personaje personaje) {
		var int numero = new Random(100).nextInt
		if(personaje.getEstadisticas().luchoCantidadDeVecesEnPosicion(personaje.getPosicionIdeal()) >= 1 && numero > 30)
			return this
		return null
	}
}

//Manco es cuando tiene un Duelo realizado en la mejor posicion y además saco un numero al azar mayor a 30