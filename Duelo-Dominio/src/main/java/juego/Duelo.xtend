package juego

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@ Accessors class Duelo {
	
	var Juego juego
	var Jugador jugador1			//Jugador que inicio el Duelo
	var Jugador jugador2			//Jugador contrincante
	var Personaje personaje1		//Personaje del Jugador 1
	var Personaje personaje2		//Personaje del Jugador 2
	var Personaje personajeGanador	//Personaje que resulta ganador, en caso de empate queda en null
	
	new(Jugador jugador1){
		this.jugador1 = jugador1
		this.jugador2 = null
		this.personajeGanador = null
		this.personaje1 = null
		this.personaje2 = null
	}
	
	def seleccionarPersonaje(Personaje personaje1){
		this.personaje1 = personaje1;
	}
	
	def seleccionarPosicion(Posicion posicion){
		this.personaje1.setPosicionActual(posicion)
		this.juego.buscarContrincante(this)
		this.jugar()
	}
	
	def void cancelarDuelo(){
		this.juego.terminoDuelo(this)
	}
	
	def retarAMRX(){
		this.jugador2 = new Jugador_MR_X("MR_X", this.juego)
		this.personaje2 = this.jugador2.getPersonajeAlazar()
		this.jugar()
	}

	def luchar(){		
		switch  personaje1{
		case personaje1.poderDeAtaque()>this.personaje2.poderDeAtaque() : this.personajeGanador = this.personaje1
		case personaje1.poderDeAtaque()<this.personaje2.poderDeAtaque(): this.personajeGanador = this.personaje2
		case personaje1.poderDeAtaque()== this.personaje2.poderDeAtaque(): this.personajeGanador = null
		}
	}
	
	def void jugar(){
		this.luchar()
		this.actualizarEstadisticas()
		this.actualizarPoderDeAtaque()
		this.actualizarRanking()
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
	}
}