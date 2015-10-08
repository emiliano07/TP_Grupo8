package juego

import calificacion.CentroDeCalificaciones
import java.util.List
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Estadisticas {
	
	var List<Resultado> resultados
	
	new(){
		this.resultados = newArrayList
	}
	
	def int getCantUsado(Personaje personaje) {
	//Cantidad de veces que lo uso para iniciar un Duelo
		var int cantUsado = 0
		for(Resultado resultado : this.resultados){
			if(resultado.inicieDuelo && resultado.personaje == personaje)
				cantUsado++
		}
		return cantUsado
	}
	
	def int getCantGanado(Personaje personaje) {
	//Cantidad de veces que gano un Duelo
	var int cantGanado = 0
		for(Resultado resultado : this.resultados){
			if(resultado.ganeDuelo && resultado.personaje == personaje)
				cantGanado++
		}
		return cantGanado
	}
	
	def int getKills(Personaje personaje) {
	//Cantidad de Duelos que gano que no fueron inicializados por el Jugador
		var int kills = 0
		for(Resultado resultado : this.resultados){
			if(! resultado.inicieDuelo && resultado.ganeDuelo && resultado.personaje == personaje)
				kills++
		}
		return kills
	}
	
	def int getDeads(Personaje personaje) {
	//Cantidad de Duelos que perdio que no fueron inicializados por el Jugador
		var int deads = 0
		for(Resultado resultado : this.resultados){
			if(! resultado.inicieDuelo && ! resultado.ganeDuelo && ! resultado.empateDuelo && resultado.personaje == personaje)
				deads++
		}
		return deads
	}
		
	def int getAssists(Personaje personaje) {
	//Cantidad de Duelos que empato (iniciados o no por el Jugador)
	var int assists = 0
		for(Resultado resultado : this.resultados){
			if(resultado.empateDuelo && resultado.personaje == personaje)
				assists++
		}
		return assists
	}
	
	def List<Posicion> getPosicionesEnLasQueInicioUnDuelo(Personaje personaje) {
		//Posiciones en las que un Jugador inicio un Duelo
		var List<Posicion> posiciones = newArrayList
		for(Resultado resultado : this.resultados){
			if(resultado.inicieDuelo && resultado.personaje == personaje)
				posiciones.add(resultado.posicion)
		}
		return posiciones
	}
	
	def Posicion getMejorUbicacion(Personaje personaje) {
	//La ultima Posicion en la que gano un Duelo
		var Posicion mejorUbicacion = null
		for(Resultado resultado : this.resultados){
			if(resultado.ganeDuelo && resultado.personaje == personaje)
				mejorUbicacion = resultado.posicion
		}
		return mejorUbicacion
	}
	
	def getCalificacion(Jugador jugador, Personaje personaje, CentroDeCalificaciones centroDeCalificaciones) {
		//Ultima Calificacion obtenida por el Personaje en un Duelo
		return centroDeCalificaciones.actualizarCalificacion(jugador, personaje)
	}
	
	def int luchoCantidadDeVecesEnPosicion(Jugador jugador, Personaje personaje, Posicion posicion){
		var int cantidad = 0
		for(Posicion p : this.getPosicionesEnLasQueInicioUnDuelo(personaje)){
			if(p.getNombre() == posicion.getNombre())
				cantidad++
	}
		return cantidad
	}
	
	def int luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(Jugador jugador, Posicion posicion){
		var int cantidad = 0
		for(Personaje p : this.personajesUsados){
				cantidad += jugador.estadisticas.luchoCantidadDeVecesEnPosicion(jugador, p, posicion)
		}
		return cantidad
	}
	
	def agregarResultado(Resultado resultado){
		this.resultados.add(resultado)
	}
	
	def getPersonajesUsados() {
		var List<Personaje> personajesUsados = newArrayList
		for(Resultado resultado : this.resultados){
			if(! personajesUsados.contains(resultado.personaje))
				personajesUsados.add(resultado.personaje)
		}
		return personajesUsados
	}
}