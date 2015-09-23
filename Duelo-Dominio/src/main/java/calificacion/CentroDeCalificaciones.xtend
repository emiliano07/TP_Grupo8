package calificacion

import java.util.List
import juego.Estadisticas
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class CentroDeCalificaciones {
	
	var List<Calificacion> calificacionesPosibles	//Ordenada de mayor a menor valor de Calificación
	
	new(){
		this.calificacionesPosibles = newArrayList
	}
	
	def void agregarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.add(calificacion)
		this.calificacionesPosibles.sortInplaceBy[valor].reverse
	}
	
	def void eliminarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.remove(calificacion)	
	}
	
	def Calificacion actualizarCalificacion(Calificacion calificacion, Estadisticas estadisticas){
		var Calificacion calificacionFinal = calificacion
		for (Calificacion calif : this.calificacionesPosibles){
			if(calificacionFinal.getValor() > calif.getValor() && calif.puedeActualizar(estadisticas))
				calificacionFinal = calif
		}
		return calificacionFinal
	}	
}