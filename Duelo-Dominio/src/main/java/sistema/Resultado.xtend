package sistema

import posicion.Posicion

class Resultado {
	
	var Personaje personaje
	var Posicion posicionIdeal
	var Boolean siGano
	
	new(Personaje personaje, Posicion posicionIdeal, Boolean siGano){
		this.personaje = personaje
		this.posicionIdeal = posicionIdeal
		this.siGano = siGano
	}
}