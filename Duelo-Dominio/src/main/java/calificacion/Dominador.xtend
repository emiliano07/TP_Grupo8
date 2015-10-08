package calificacion

import juego.Personaje
import jugador.Jugador

class Dominador extends Calificacion {
	
	/*
	Dominador:
	Es cuando tiene experiencia en al menos 2 Duelos jugando con el Personaje en su Posición ideal
	y además saco un número al azar mayor a 70
	*/
	
	new(){
		super("Dominador",75)
	}
	
	override puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar) {
		jugador.estadisticas.luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(jugador, personaje.getPosicionIdeal) >= 2 && numeroAlAzar > 70
	}
}