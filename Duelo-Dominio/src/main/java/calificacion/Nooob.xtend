package calificacion

import juego.Personaje
import jugador.Jugador

class Nooob extends Calificacion {
	
	/*
	Noob:
	Es en cualquier caso
	*/
	
	new(){
		super("Nooob",5)
	}
	
	override puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar) {
		return true
	}
}