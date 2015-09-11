package sistema

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Sistema {
	
	var List<Jugador> ranking = newArrayList
	var ArrayList<Personaje> personajesActivados
	
	new(){
		this.ranking = new ArrayList<Jugador>
		this.personajesActivados = new ArrayList<Personaje>()
	}
	
	def agregarPersonaje(Personaje personaje){
		this.personajesActivados.add(personaje)
	}
	
	def eliminarPersonaje(Personaje personaje){
		this.personajesActivados.remove(personaje)
	}
	
	def activarPersonaje(Personaje personaje){
		personaje.activar()
	}
	
	def desactivarPersonaje(Personaje personaje){
		personaje.desactivar()
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
	
	def escalonDondeEstoy(Jugador jug){
		var int limite = this.ranking.get(0).getPuntaje()-500
		var ArrayList<Jugador> escalon = new ArrayList<Jugador>()
		for (Jugador jugador : this.ranking){
			if(jugador.getPuntaje > limite)
				escalon.add(jugador)
			else{
				if(escalon.contains(jug)){
					escalon.remove(jug)
					return escalon
				}
					
				escalon.removeAll()
				escalon.add(jugador)
				limite = limite -500
			}
		}
	}
	
	
}