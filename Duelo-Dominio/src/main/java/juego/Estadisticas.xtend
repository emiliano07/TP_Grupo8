package juego

import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import calificacion.Nooob
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors class Estadisticas {
	
	var Personaje personajeAlQuePertenece
	var CentroDeCalificaciones centroDeCalificaciones
	
	var int cantUsado					//Cantidad de veces que lo uso para iniciar un Duelo
	var int cantGanado 					//Cantidad de veces que gano un Duelo
	var int kills						//Cantidad de Duelos que gano que no fueron inicializados por el Jugador
	var int deads						//Cantidad de Duelos que perdio que no fueron inicializados por el Jugador
	var int assists						//Cantidad de Duelos que empato (iniciados o no por el Jugador)
	var List<Posicion> posiciones	//Posiciones en las que un Jugador inicio un Duelo
	var Posicion mejorUbicacion			//La ultima Posicion en la que gano un Duelo
	var Calificacion calificacion		//Ultima Calificacion obtenida por el Personaje en un Duelo
	
	new(){
		this.cantUsado = 0
		this.cantGanado = 0
		this.kills = 0
		this.deads = 0
		this.assists = 0
		this.posiciones = newArrayList
		this.mejorUbicacion = null					
		this.calificacion = new Nooob()
	}
	
	def actualizarCantUsado(Duelo duelo) {
		if(duelo.getJugador1() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			this.cantUsado ++
	}
	
	def actualizarCantGanado(Duelo duelo) {
		if(duelo.getPersonajeGanador() == this.personajeAlQuePertenece)
			this.cantGanado ++
	}
	
	def actualizarKills(Duelo duelo) {
		if(duelo.getJugador2() == this.personajeAlQuePertenece.getJugadorAlQuePertenece() && duelo.getPersonajeGanador() == this.personajeAlQuePertenece)
			this.kills ++
	}
	
	def actualizarDeads(Duelo duelo) {
			if(duelo.getJugador2() == this.personajeAlQuePertenece.getJugadorAlQuePertenece() && duelo.getPersonajeGanador() != this.personajeAlQuePertenece && duelo.getPersonajeGanador() != null)
			this.deads ++
	}
		
	def actualizarAssists(Duelo duelo) {
			if(duelo.getPersonajeGanador() == null)
			this.assists ++
	}
	
	def actualizarPosicionesEnLasQueInicioUnDuelo(Duelo duelo) {
		if(duelo.getJugador1() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			this.posiciones.add(duelo.getPersonaje1().getPosicionActual())
	}
	
	def actualizarMejorUbicacion(Duelo duelo) {
		if(duelo.getPersonajeGanador() == this.personajeAlQuePertenece)
			this.mejorUbicacion = duelo.getPersonajeGanador().getPosicionActual()
	}
	
	def actualizarCalificacion() {
		this.centroDeCalificaciones.actualizarCalificacion(this.calificacion, this)
	}
	
	def actualizarEstadisticas(Duelo duelo){
		this.actualizarCantUsado(duelo)
		this.actualizarCantGanado(duelo)
		this.actualizarKills(duelo)
		this.actualizarDeads(duelo)
		this.actualizarAssists(duelo)
		this.actualizarMejorUbicacion(duelo)
		this.actualizarCalificacion()
	}
	
	def int luchoCantidadDeVecesEnPosicion(Posicion posicion){
		var int cantidad = 0
		for(Posicion p : this.posiciones){
			if(p.getNombre() == posicion.getNombre())
				cantidad++
		}
		return cantidad
	}
	
	def int luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(Posicion posicion){
		var int cantidad = 0
		for(Personaje p : this.personajeAlQuePertenece.getJugadorAlQuePertenece.personajesUsados){
				cantidad += p.getEstadisticas().luchoCantidadDeVecesEnPosicion(posicion)
		}
		return cantidad
	}
}