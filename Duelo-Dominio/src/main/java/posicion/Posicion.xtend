package posicion

import org.uqbar.commons.utils.Observable

@Observable
abstract class Posicion {
	
	var String nombre
	
	new(String nombre){
		this.nombre = nombre
	}
	
	def String getNombre(){
		return this.nombre
	}
}