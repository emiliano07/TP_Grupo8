package calificacion

import sistema.Estadisticas

class Nooob extends Calificacion {
	
	override actualizar(Estadisticas estadisticas) {
		if(estadisticas.getPerdidosEnPosicionNoIdeal > 0)
			return this
		return null
	}
}

//Pasa cuando el Jugador pierde el Duelo y eligió jugar con el Personaje en una Posición que no era la ideal