package sistema

import java.util.ArrayList
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Sistema {
	 
	var List<Jugador> ranking = newArrayList
	private var ArrayList<Personaje> personajes		//Todos los Personajes que existen en el Sistema
	var ArrayList<Personaje> personajesActivados	//Personajes habilitados para que el Jugador utilice en un Duelo
	var ArrayList<Duelo> duelosActivos
	
	new(){
		this.ranking = new ArrayList<Jugador>
		this.personajes = new ArrayList<Personaje>()
		this.personajesActivados = new ArrayList<Personaje>()
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
	
	def actualizarRanking(){
		this.ranking = this.getRanking().sortInplaceBy[puntaje].reverse
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