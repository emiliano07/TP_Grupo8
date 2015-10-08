package calificacion

import juego.Personaje
import jugador.Jugador

class Rampage extends Calificacion {
	
	/*
	Rampage:
	Es cuando tiene experiencia en al menos 5 Duelos jugando con el Personaje en su Posición ideal 
	y además saco un número al azar mayor a 90 
	*/
	
	new(){
		super("Rampage",100)
	}
	
	override puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar) {
	jugador.estadisticas.luchoCantidadDeVecesEnPosicion(jugador, personaje, personaje.getPosicionIdeal()) >= 5  && numeroAlAzar > 90
	}
}