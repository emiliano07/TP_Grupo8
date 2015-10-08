package juego

import calificacion.CentroDeCalificaciones
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Personaje {
	
	var String nombre
	var String especialidades
	var String debilidades
	var Posicion posicionIdeal
	
	new (String nombre, String debilidades, String especialidades, Posicion posicionIdeal, CentroDeCalificaciones centroDeCalificaciones){
		this.nombre = nombre
		this.especialidades = especialidades
		this.debilidades = debilidades
		this.posicionIdeal = posicionIdeal
	}
}