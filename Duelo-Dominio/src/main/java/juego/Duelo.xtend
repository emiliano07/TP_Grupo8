package juego

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@ Accessors class Duelo {
	
	var Juego juego
	var Jugador jugador1			//Jugador que inicio el Duelo
	var Jugador jugador2			//Jugador contrincante
	var Personaje personaje1		//Personaje del Jugador 1
	var Personaje personaje2		//Personaje del Jugador 2
	var Jugador jugadorGanador		//Jugador que resulta ganador, en caso de empate aparece un No_Jugador
	
	var int poderDeAtaquePersonje1
	var int poderDeAtaquePersonje2
	
	new(Jugador jugador1, Juego juego){
		this.juego = juego
		this.jugador1 = jugador1
		this.jugador2 = null
		this.jugadorGanador = null
		this.personaje1 = null
		this.personaje2 = null
		this.poderDeAtaquePersonje1 = 0
		this.poderDeAtaquePersonje2 = 0
	}
	
	def seleccionarPersonaje(Personaje personaje1){
		this.personaje1 = personaje1;
		this.poderDeAtaquePersonje1 = this.personaje1.getPoderDeAtaque() * this.numeroAlAzar
	}
	
	def seleccionarPosicion(Posicion posicion){
		this.personaje1.setPosicionActual(posicion)
		this.juego.buscarContrincante(this)
		this.poderDeAtaquePersonje2 = this.personaje2.getPoderDeAtaque() * this.numeroAlAzar
		this.jugar()
	}
	
	def void cancelarDuelo(){
		juego.terminoDuelo(this)
	}
	
	def void retarAMRX(){
		this.jugador2 = new Jugador_MR_X("MR_X", this.juego)
		this.personaje2 = this.jugador2.getPersonajeAlazar()
		this.jugar()
	}

	def luchar(){		
		switch  personaje1{
		case this.poderDeAtaquePersonje1 > this.poderDeAtaquePersonje2 : this.jugadorGanador = this.jugador1
		case this.poderDeAtaquePersonje1 < this.poderDeAtaquePersonje2 : this.jugadorGanador = this.jugador2
		case this.poderDeAtaquePersonje1 == this.poderDeAtaquePersonje2 : this.jugadorGanador = new No_Jugador("Jugador creado en caso de empate", this.jugador1.getJuego()) //En caso de empate devuelve un No_Jugador
		}
	}
	
	def numeroAlAzar(){
		return Math.round(Math.random()*1).intValue
	}
	
	def void jugar(){
		this.luchar()
		this.actualizarEstadisticas()
		this.actualizarPoderDeAtaque()
		this.actualizarLaPuntajes()
	}
	
	def actualizarEstadisticas(){
		this.personaje1.actualizarEstadisticas(this)
		this.personaje2.actualizarEstadisticas(this)
	}
	
	def actualizarPoderDeAtaque(){
		this.personaje1.actualizarPoderDeAtaque()
		this.personaje2.actualizarPoderDeAtaque()
	}
	
	def actualizarLaPuntajes(){
		this.jugador1.actualizarPuntaje()
		this.jugador2.actualizarPuntaje()
	}
}