package calificacion

import juego.Personaje
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Calificacion {
	
	var String nombre
	var int valor
	
	new(String nombre, int valor){
		this.nombre = nombre
		this.valor = valor
	}
	
	def numeroAlAzar(){
		return Math.round(Math.random()*101).intValue
	}
	
	def abstract Boolean puedeActualizar(Jugador jugador, Personaje personaje, int numeroAlAzar)
}