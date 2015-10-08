package calificacion

import juego.Personaje
import jugador.Jugador

class Killing_Spread extends Calificacion {
	
	/*
	Killing_Spread: 
	Es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal 
	y además saco un número al azar mayor a 50
	*/
	
	new(){
		super("Killing_Spread",60)
	}
	
	override puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar) {
		jugador.estadisticas.luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(jugador, personaje.getPosicionIdeal()) >= 2 && numeroAlAzar > 50
	}
}