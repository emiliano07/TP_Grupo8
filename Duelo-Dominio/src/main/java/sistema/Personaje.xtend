package sistema

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors class Personaje {
	
	var String nombre
	var Estadisticas estadisticas
	var String especialidades
	var String debilidades
	var Posicion posicionIdeal
	
	var Posicion posicionActual
	var int poderDeAtaque
	var Boolean activado
	
	new(String nombre){
		this.nombre = nombre
	}
	
	def activar(){
		this.activado = true
	}
	
	def desactivar(){
		this.activado = false
	}
	
	def actualizarPoderDeAtaque(){
		var int factor = Math.round(Math.random()*1).intValue
		this.poderDeAtaque = (estadisticas.getCalificacion().getValor() + (estadisticas.getKills() + estadisticas.getAssists() /2 - estadisticas.getDeads()) * estadisticas.getCantUsado())* factor
	}
	
	def actualizarEstadisticas(Duelo duelo) {
		this.estadisticas.actualizarEstadisticas(duelo)
	}
	
}