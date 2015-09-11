package sistema

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@ Accessors class Duelo {
	
	var Sistema sistema
	var Jugador jugador1		//Jugador que inicio el Duelo
	var Jugador jugador2		//Jugador contrincante
	var Personaje personaje1
	var Personaje personaje2
	var Personaje ganador
	
	new(Jugador jugador1){
		this.jugador1 = jugador1
	}
	
	def seleccionarPersonajeYPosicion(Personaje personaje1, Posicion posicion){
		this.personaje1 = personaje1;
		this.personaje1.setPosicionActual(posicion)
	}

	def buscarContrincante(){
		var escalon = sistema.escalonDondeEstoy(jugador1)
		var int seleccion = new Random(escalon.size()).nextInt
		if(!escalon.isEmpty()){
			this.jugador2 = escalon.get(seleccion)
			this.personaje2 = jugador2.getPersonajeAlazar()
		}
		else {
			//si no hay se tira excepcion -> luchar con el bot o descansar
		}
	}
	
	def luchar(){		
		switch  personaje1{
		case personaje1.getPoderDeAtaque()>this.personaje2.getPoderDeAtaque() : this.ganador = this.personaje1
		case personaje1.getPoderDeAtaque()<this.personaje2.getPoderDeAtaque(): this.ganador = this.personaje2
		case personaje1.getPoderDeAtaque()== this.personaje2.getPoderDeAtaque(): this.ganador = new Personaje_Empate("Personaje Empate")
	}
}
	
	def actualizarEstadisticas(){
		this.personaje1.actualizarEstadisticas(this)
		this.personaje2.actualizarEstadisticas(this)
	}
	
	def actualizarPoderDeAtaque(){
		this.personaje1.actualizarPoderDeAtaque()
		this.personaje2.actualizarPoderDeAtaque()
	}
	
	def actualizarRanking(){
		this.jugador1.actualizarPuntaje()
		this.jugador2.actualizarPuntaje()
		this.sistema.actualizarRanking()
	}
	
	def jugar(Personaje personaje1, Posicion posicion){
		this.seleccionarPersonajeYPosicion(personaje1, posicion)
		this.buscarContrincante()
		this.luchar()
		this.actualizarEstadisticas()
		this.actualizarPoderDeAtaque()
		this.actualizarRanking()
	}
}