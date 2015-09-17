package juego

import java.util.ArrayList
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Juego {
	 
	var List<Jugador> jugadores = newArrayList
	private var List<Personaje> personajes		//Todos los Personajes que existen en el Sistema
	var List<Personaje> personajesActivados	//Personajes habilitados para que el Jugador utilice en un Duelo
	var List<Duelo> duelosActivos
	
	new(){
		this.jugadores= newArrayList
		this.personajes = newArrayList
		this.personajesActivados = newArrayList
	}
	
	def List<Jugador> getRanking(){
		jugadores.sortBy[puntaje].reverse
	}
	
	def agregarPersonaje(Personaje personaje){
		this.personajes.add(personaje)
	}
	
	def nuevoDuelo(Duelo duelo){
		this.duelosActivos.add(duelo)
	}
	
	def terminoDuelo(Duelo duelo){
		this.duelosActivos.remove(duelo)
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
		 this.ranking.add(jugador)
	}
	
	def eliminarJugador(Jugador jugador){
		this.ranking.remove(jugador)
	}
	
	def void buscarContrincante(Duelo duelo){
		var posiblesRivales = this.posiblesRivales(duelo.getJugador1())
		var int seleccion = new Random(posiblesRivales.size()).nextInt
		if(!posiblesRivales.isEmpty()){
			duelo.setJugador2(posiblesRivales.get(seleccion))
			duelo.setPersonaje2(duelo.getJugador2().getPersonajeAlazar())
		}
		else {
			throw new NoHayContrincanteException()
		}
	}
	
	def posiblesRivales(Jugador jug){
		var ArrayList<Jugador> posiblesRivales = new ArrayList<Jugador>()
		for (Jugador jugador : this.ranking){
			if(Math.abs(jugador.getPuntaje() - jug.getPuntaje()) <= 100)
				posiblesRivales.add(jugador)
		}
		return posiblesRivales
	}

}