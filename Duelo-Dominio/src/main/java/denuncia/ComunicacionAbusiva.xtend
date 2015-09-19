package denuncia

import juego.Jugador
import org.uqbar.commons.utils.Observable

@Observable
class ComunicacionAbusiva extends Denuncia{
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		super(7,jugadorDenunciante,jugadorDenunciado)
	}
	
	override getNombre() {
		"Comunicacion Abusiva"
	}
	
}