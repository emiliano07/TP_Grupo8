package calificacion

import java.util.List
import juego.Estadisticas
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class CentroDeCalificaciones {
	
	var List<Calificacion> calificacionesPosibles	//Ordenada de mayor a menor valor de Calificación
	
	new(){
		this.calificacionesPosibles = newArrayList
	}
	
	def agregarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.add(calificacion)
		this.calificacionesPosibles = this.calificacionesPosibles.sortInplaceBy[valor].reverse
	}
	
	def eliminarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.remove(calificacion)	
	}
	
	def Calificacion actualizarCalificacion(Calificacion calificacion, Estadisticas estadisticas){
		var Calificacion calificacionFinal = calificacion
		for (Calificacion calif : this.calificacionesPosibles){
			if(calificacionFinal.getValor() < calif.getValor() && calif.puedeActualizar(estadisticas))
				calificacionFinal = calif
		}
		return calificacionFinal
	}
}