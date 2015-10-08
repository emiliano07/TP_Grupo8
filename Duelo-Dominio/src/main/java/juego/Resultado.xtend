package juego

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors
class Resultado {

	var Boolean inicieDuelo		//True si inicio el Duelo
	var Personaje personaje		//Personaje que uso
	var Posicion posicion		//Posición del Personaje que uso
	var Boolean ganeDuelo		//True si gane el Duelo
	var Boolean empateDuelo		//True si empate el Duelo
	
	new(Boolean inicieDuelo, Personaje personaje, Posicion posicion, Boolean ganeDuelo, Boolean empateDuelo){
		this.inicieDuelo = inicieDuelo
		this.personaje = personaje
		this.posicion = posicion
		this.ganeDuelo = ganeDuelo
		this.empateDuelo = empateDuelo
	}
}