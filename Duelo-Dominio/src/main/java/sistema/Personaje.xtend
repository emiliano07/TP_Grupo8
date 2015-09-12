package sistema

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors class Personaje {
	
	var Jugador jugadorAlQuePertenece
	var String nombre
	var Estadisticas estadisticas
	var String especialidades
	var String debilidades
	var Posicion posicionIdeal
	var Posicion posicionActual
	var int poderDeAtaque
	
	new(String nombre){
		this.nombre = nombre
	}
	
	def actualizarPoderDeAtaque(){
		this.poderDeAtaque = estadisticas.getCalificacion().getValor() + (estadisticas.getKills() + estadisticas.getAssists() /2 - estadisticas.getDeads()) * estadisticas.getCantUsado()
	}
	
	def poderDeAtaque(){
		var int factor = Math.round(Math.random()*1).intValue
		return (this.poderDeAtaque * factor)
	}
	
	def actualizarEstadisticas(Duelo duelo) {
		this.estadisticas.actualizarEstadisticas(duelo)
	}
	
}