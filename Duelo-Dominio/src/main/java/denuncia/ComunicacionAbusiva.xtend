package denuncia

import org.uqbar.commons.utils.Observable

@Observable
class ComunicacionAbusiva extends Denuncia{
	
	new(){
		super(7)
	}
	
	override getNombre() {
		"Comunicacion Abusiva"
	}
	
}