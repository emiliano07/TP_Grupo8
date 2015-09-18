package juego

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Juego {
	 
	var List<Jugador> jugadores 
	private var List<Personaje> personajes		//Todos los Personajes que existen en el Sistema
	var List<Personaje> personajesActivados	//Personajes habilitados para que el Jugador utilice en un Duelo
	var List<Duelo> duelosActivos
	
	new(){
		this.jugadores= newArrayList
		this.personajes = newArrayList
		this.personajesActivados = newArrayList
		this.duelosActivos = newArrayList
	}
	
	def List<Jugador> getRanking(){
		jugadores.sortInplaceBy[puntaje].reverse
	}
	
	def agregarPersonaje(Personaje personaje){
		this.personajes.add(personaje)
	}
	
	def void nuevoDuelo(Duelo duelo){
		this.duelosActivos.add(duelo)
	}
	
	def terminoDuelo(Duelo duelo){
		duelosActivos.remove(duelo)
	}

	def eliminarPersonaje(Personaje personaje){
		this.personajes.remove(personaje)
	}
	
	def activarPersonaje(Personaje personaje){
		this.personajesActivados.add(personaje)
	}
	
	def desactivarPersonaje(Personaje personaje){
		this.personajesActivados.remove(personaje)
	}
	
	def void agregarJugador (Jugador jugador){
		 this.jugadores.add(jugador)
	}
	
	def eliminarJugador(Jugador jugador){
		this.jugadores.remove(jugador)
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
		for (Jugador jugador : this.jugadores){
			if(Math.abs(jugador.getPuntaje() - jug.getPuntaje()) <= 100)
				posiblesRivales.add(jugador)
		}
		return posiblesRivales
	}

}