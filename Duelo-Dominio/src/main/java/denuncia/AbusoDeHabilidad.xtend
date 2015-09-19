package denuncia

import juego.Jugador
import org.uqbar.commons.utils.Observable

@Observable
class Abuso_de_habilidad extends Denuncia{
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		super(5,jugadorDenunciante,jugadorDenunciado)
	}
	
	override getNombre() {
		"Abuso de Habilidad"
	}
	
}