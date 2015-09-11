package calificacion

import java.util.ArrayList
import sistema.Estadisticas

class CentroDeCalificaciones {
	
	var ArrayList<Calificacion> calificacionesPosibles			//Ordenada de mayor valor de Calificacion a menor valor
	
	new(){
	}
	
	def agregarCalificacion (Calificacion calificacion){	
		this.calificacionesPosibles.add(calificacion)
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
			if(calificacionFinal.getValor() < c.getValor() && c.actualizar(estadisticas) != null)
				calificacionFinal = c.actualizar(estadisticas)
		}
		return calificacionFinal
	}
}