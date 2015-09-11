package sistema

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Sistema {
	
	var ArrayList<Jugador> ranking
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
	
	def void agregarJugador (Jugador jugador){	//Se puede ordenar automaticamente de alguna forma?
		var ArrayList<Jugador> jugadoresAux = this.ranking
		var ArrayList<Jugador> rankingFinal = new ArrayList<Jugador>()
		while(!jugadoresAux.isEmpty()){
			if(jugadoresAux.get(0).getPuntaje()>jugador.getPuntaje()){
				rankingFinal.add(jugadoresAux.get(0))
				jugadoresAux.remove(jugadoresAux.get(0))
			}
			else{
				rankingFinal.add(jugador)
				rankingFinal.addAll(jugadoresAux)
				jugadoresAux.removeAll()
			}
		}
		this.ranking = rankingFinal
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
	
	def eliminarJugador(Jugador jugador){
		this.ranking.remove(jugador)
	}
	
	def actualizarJugador(Jugador jugador){
		this.eliminarJugador(jugador)
		this.agregarJugador(jugador)
	}
	
	/*
	def armarEscalones(){
		var List<List<Jugador>> escalones
		var int limite = this.ranking.get(0).getPuntaje()-500
		var List<Jugador> paquete
		for (Jugador jugador : this.ranking){
			if(jugador.getPuntaje > limite)
				paquete.add(jugador)
			else
				escalones.add(paquete)
				paquete.removeAll()
				paquete.add(jugador)
				limite = limite -500
		}
		return escalones
	}
	 */
	
	//tengo un listado de usuarios ordenados por puntaje de mayor a menor
	//a medida que termino un duelo y actualizo los puntajes los elimino y agrego a la lista en su nueva posicion del ranking
	//para armar los escalones hago un for de la lista de jugadores y los separo en paquetes de 500 puntos
	//verifico en cual de los paquetes estoy yo(jugador que inicio un duelo) y busco al azar a uno de los que esta dentro del paquete
	//si hay lucho, si no hay tiro la excepcion (bot o descanso)
}