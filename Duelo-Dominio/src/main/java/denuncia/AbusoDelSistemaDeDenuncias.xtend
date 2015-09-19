package denuncia

import juego.Jugador

class AbusoDelSistemaDeDenuncias extends Denuncia {
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		super(25,jugadorDenunciante,jugadorDenunciado)
	}
	
	override getNombre() {
		"Abuso del Sistema de Denuncias"
	}
	
}