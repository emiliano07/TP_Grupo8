package denuncia

import jugador.Jugador

class FeedIntencional extends Denuncia{
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		super(10,jugadorDenunciante,jugadorDenunciado)
	}
	
	override getNombre() {
		"Feed Intencional"
	}
}