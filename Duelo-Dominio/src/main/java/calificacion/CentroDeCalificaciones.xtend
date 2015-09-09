package calificacion

import java.util.ArrayList
import sistema.Estadisticas

class CentroDeCalificaciones {
	
	var ArrayList<Calificacion> calificacionesPosibles			//Ordenada de mayor valor de Calificacion a menor valor
	
	new(){
	}
	
	def agregarCalificacion (Calificacion calificacion){	//Se puede ordenar automaticamente de alguna forma?
		var ArrayList<Calificacion> calificacionesPosiblesAux = this.calificacionesPosibles
		var ArrayList<Calificacion> calificacionesPosiblesFinal	= new ArrayList<Calificacion>()
		while(!calificacionesPosiblesAux.isEmpty()){
			if(calificacionesPosiblesAux.get(0).getValor()>calificacion.getValor()){
				calificacionesPosiblesFinal.add(calificacionesPosiblesAux.get(0))
				calificacionesPosiblesAux.remove(calificacionesPosiblesAux.get(0))
			}
			else{
				calificacionesPosiblesFinal.add(calificacion)
				calificacionesPosiblesFinal.addAll(calificacionesPosiblesAux)
				calificacionesPosiblesAux.removeAll()
			}
		}
		this.calificacionesPosibles = calificacionesPosiblesFinal
	}
	/*
	def agregarCalificacion2 (Calificacion calificacion){	//Se puede ordenar automaticamente de alguna forma?
		Collections.sort(this.calificacionesPosibles,new Comparator(){
			override compare(Calificacion c1, Calificacion c2) {
				return new Integer(c1.getValor()).compareTo(new Integer(c2.getValor()))
			}
			
		})
	}
	*/
	def eliminarCalificacion (Calificacion calificacion){
		this.calificacionesPosibles.remove(calificacion)
		//this.calificacionesPosibles.sortBy[c|calificacion.getValor()]		
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