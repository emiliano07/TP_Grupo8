package calificacion

import java.util.List
import juego.Estadisticas

class CentroDeCalificaciones {
	
	var List<Calificacion> calificacionesPosibles	//Ordenada de mayor valor de Calificacion a menor valor
	
	new(){
	}
	
	def agregarCalificacion (Calificacion calificacion){	
		this.calificacionesPosibles.add(calificacion)
		this.calificacionesPosibles = this.calificacionesPosibles.sortInplaceBy[valor].reverse
	}
	
	def eliminarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.remove(calificacion)	
	}
	
	def getCalificacion(){
		return this.calificacionesPosibles
	}
	
	def actualizarCalificacion(Calificacion calificacion, Estadisticas estadisticas){
		var Calificacion calificacionFinal = calificacion
		for (Calificacion c : this.calificacionesPosibles){
			if(calificacionFinal.getValor() < c.getValor() && c.actualizar(estadisticas.getPersonajeAlQuePertenece()) != null)
				calificacionFinal = c.actualizar(estadisticas.getPersonajeAlQuePertenece())
		}
		return calificacionFinal
	}
}