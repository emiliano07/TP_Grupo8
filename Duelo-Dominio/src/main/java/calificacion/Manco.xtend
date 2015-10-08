package calificacion

import juego.Personaje
import jugador.Jugador

class Manco extends Calificacion {
	
	/*
	Manco:
	Es cuando tiene un Duelo realizado en la mejor posicion y además saco un número al azar mayor a 30
	*/
	
	new(){
		super("Manco",15)
	}
	
	override puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar) {
		jugador.estadisticas.luchoCantidadDeVecesEnPosicion(jugador, personaje, personaje.getPosicionIdeal()) >= 1 && numeroAlAzar > 30
	}
}