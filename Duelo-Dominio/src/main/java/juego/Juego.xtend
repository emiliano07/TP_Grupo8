package juego

import calificacion.CentroDeCalificaciones
import java.util.List
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Juego {
	 
	var List<Jugador> jugadores 
	private var List<Personaje> personajes
	var List<Duelo> duelosActivos
	var CentroDeCalificaciones centroDeCalificaciones
	
	new(){
		this.jugadores= newArrayList
		this.personajes = newArrayList
		this.duelosActivos = newArrayList
		this.centroDeCalificaciones = new CentroDeCalificaciones
	}
	
	def List<Jugador> getRanking(){
		jugadores.sortInplaceBy[puntaje].reverse
	}
	
	def agregarPersonaje(Personaje personaje){
		this.personajes.add(personaje)
		for(Jugador jug : this.jugadores){
			var Personaje p = new Personaje(personaje.nombre,personaje.debilidades,personaje.especialidades,personaje.posicionIdeal,this.centroDeCalificaciones)
			jug.personajesParaUsar.add(p)
		}
	}
	
	def eliminarPersonaje(Personaje personaje){
		this.personajes.remove(personaje)
		for(Jugador jug : this.jugadores)
			jug.personajesParaUsar.remove(personaje)
	}
	
	def void agregarJugador (Jugador jugador){
		 this.jugadores.add(jugador)
		 jugador.cargarPersonajesParaUsar()
	}
	
	def eliminarJugador(Jugador jugador){
		this.jugadores.remove(jugador)
	}
	
	def void nuevoDuelo(Duelo duelo){
		this.duelosActivos.add(duelo)
	}
	
	def terminoDuelo(Duelo duelo){
		duelosActivos.remove(duelo)
	}
	
	def void buscarContrincante(Duelo duelo){
		var posiblesRivales = this.posiblesRivales(duelo.getJugador1())
		var int seleccion = Math.round(Math.random()*(posiblesRivales.size()-1)).intValue
		if(!posiblesRivales.isEmpty()){
			duelo.setJugador2(posiblesRivales.get(seleccion))
			duelo.setPersonaje2(duelo.getJugador2().getPersonajeAlazar())
		}
		else {
			throw new NoHayContrincanteException()
		}
	}
	
	def posiblesRivales(Jugador jug){
		var List<Jugador> posiblesRivales = newArrayList
		for (Jugador jugador : this.getRanking()){
			if(Math.abs(jugador.getPuntaje() - jug.getPuntaje()) <= 100)
				posiblesRivales.add(jugador)
		}
		posiblesRivales.remove(jug)
		return posiblesRivales
	}
}