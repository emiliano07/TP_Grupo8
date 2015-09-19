package juego

import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import calificacion.Nooob
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Estadisticas {
	
	var Personaje personajeAlQuePertenece
	var CentroDeCalificaciones centroDeCalificaciones
	
	var int cantUsado					//Cantidad de veces que lo uso para iniciar un Duelo
	var int cantGanado 					//Cantidad de veces que gano un Duelo
	var int kills						//Cantidad de Duelos que gano que no fueron inicializados por el Jugador
	var int deads						//Cantidad de Duelos que perdio que no fueron inicializados por el Jugador
	var int assists						//Cantidad de Duelos que empato (iniciados o no por el Jugador)
	var List<Posicion> posiciones		//Posiciones en las que un Jugador inicio un Duelo
	var Posicion mejorUbicacion			//La ultima Posicion en la que gano un Duelo
	var Calificacion calificacion		//Ultima Calificacion obtenida por el Personaje en un Duelo
	
	new(Personaje personajeAlQuePertenece, CentroDeCalificaciones  centroDeCalificaciones){
		this.personajeAlQuePertenece = personajeAlQuePertenece
		this.centroDeCalificaciones = centroDeCalificaciones
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
		if(duelo.getJugadorGanador() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			this.cantGanado ++
	}
	
	def actualizarKills(Duelo duelo) {
		if(duelo.getJugador2() == this.personajeAlQuePertenece.getJugadorAlQuePertenece() && duelo.getJugadorGanador() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			this.kills ++
	}
	
	def actualizarDeads(Duelo duelo) {
			if(duelo.getJugador2() == this.personajeAlQuePertenece.getJugadorAlQuePertenece() && duelo.getJugadorGanador() == duelo.getJugador1())
			this.deads ++
	}
		
	def actualizarAssists(Duelo duelo) {
			if(duelo.getJugadorGanador() != duelo.getJugador1() && duelo.getJugadorGanador() != duelo.getJugador2())
			this.assists ++
	}
	
	def actualizarPosicionesEnLasQueInicioUnDuelo(Duelo duelo) {
		if(duelo.getJugador1() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			this.posiciones.add(duelo.getPersonaje1().getPosicionActual())
	}
	
	def actualizarMejorUbicacion(Duelo duelo) {
		if(duelo.getJugadorGanador() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
			if(duelo.getJugador1() == this.personajeAlQuePertenece.getJugadorAlQuePertenece())
				this.mejorUbicacion = duelo.getPersonaje1().getPosicionActual()
			else
				this.mejorUbicacion = duelo.getPersonaje2().getPosicionActual()
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