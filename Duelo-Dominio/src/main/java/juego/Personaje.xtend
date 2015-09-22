package juego

import calificacion.CentroDeCalificaciones
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Personaje {
	
	var Jugador jugadorAlQuePertenece
	var String nombre
	var Estadisticas estadisticas
	var String especialidades
	var String debilidades
	var Posicion posicionIdeal
	var Posicion posicionActual
	var int poderDeAtaque
	
	new (String nombre, String debilidades, String especialidades, Posicion posicionIdeal, CentroDeCalificaciones centroDeCalificaciones){
		this.jugadorAlQuePertenece = null
		this.nombre = nombre
		this.estadisticas = new Estadisticas(this, centroDeCalificaciones)
		this.especialidades = especialidades
		this.debilidades = debilidades
		this.posicionIdeal = posicionIdeal
		this.posicionActual = null
		this.poderDeAtaque = 0
	}
	
	def actualizarPoderDeAtaque(){
		this.poderDeAtaque = estadisticas.getCalificacion().getValor() + (estadisticas.getKills() + estadisticas.getAssists() /2 - estadisticas.getDeads()) * estadisticas.getCantUsado()
	}
	
	def actualizarEstadisticas(Duelo duelo) {
		this.estadisticas.actualizarEstadisticas(duelo)
	}
}