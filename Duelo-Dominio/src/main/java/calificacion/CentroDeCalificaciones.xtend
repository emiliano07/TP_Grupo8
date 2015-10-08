package calificacion

import java.util.List
import juego.Personaje
import jugador.Jugador
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
	
	def Calificacion actualizarCalificacion(Jugador jugador, Personaje personaje){
		var Calificacion calificacionFinal = new Nooob
		for (Calificacion calif : this.calificacionesPosibles){
			if(calificacionFinal.valor < calif.valor && calif.puedeActualizar(jugador, personaje, calif.numeroAlAzar))
				calificacionFinal = calif
		}
		return calificacionFinal
	}
}