package calificacion

import sistema.Estadisticas

class Manco extends Calificacion {
	
	override actualizar(Estadisticas estadisticas) {
		if(estadisticas.getPerdidosEnPosicionIdeal > 0)
			return this
		return null
	}
}

//Pasa cuando el Jugador pierde el Duelo pero juega en la Posicion ideal