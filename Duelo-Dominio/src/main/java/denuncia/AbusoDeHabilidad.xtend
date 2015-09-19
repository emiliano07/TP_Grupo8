package denuncia

import org.uqbar.commons.utils.Observable

@Observable
class Abuso_de_habilidad extends Denuncia{
	
	new(){
		super(5)
	}
	
	override getNombre() {
		"Abuso de Habilidad"
	}
	
}