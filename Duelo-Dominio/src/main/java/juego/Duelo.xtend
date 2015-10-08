package juego

import jugador.Jugador
import jugador.Jugador_MR_X
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@ Accessors class Duelo {
	
	var Juego juego
	var Jugador jugador1			//Jugador que inicio el Duelo
	var Jugador jugador2			//Jugador contrincante
	var Personaje personaje1		//Personaje del Jugador 1
	var Personaje personaje2		//Personaje del Jugador 2
	var int poderDeAtaquePersonaje1	//Poder de ataque del Personaje 1
	var int poderDeAtaquePersonaje2	//Poder de ataque del Personaje 2
	var Posicion posicionPersonaje1	//Posición del Personaje 1
	var Posicion posicionPersonaje2	//Posición del Personaje 2
	var Resultado resultadoJugador1	//Resultado del Duelo para el Jugador1
	var Resultado resultadoJugador2	//Resultado del Duelo para el Jugador2
	
	new(Jugador jugador1, Juego juego){
		this.juego = juego
		this.jugador1 = jugador1
		this.jugador2 = null
		this.personaje1 = null
		this.personaje2 = null
		this.poderDeAtaquePersonaje1 = 0
		this.poderDeAtaquePersonaje2 = 0
		this.resultadoJugador1 = null
		this.resultadoJugador2 = null
	}
	
	def void seleccionarPersonaje(Personaje personaje1){
		this.personaje1 = personaje1;
	}
	
	def void seleccionarPosicion(Posicion posicion){
		this.posicionPersonaje1 = posicion
		this.juego.buscarContrincante(this)
		this.posicionPersonaje2 = this.personaje2.getPosicionIdeal()
		this.poderDeAtaquePersonaje1 = this.jugador1.getPoderDeAtaque(this.personaje1) * this.numeroAlAzar
		this.poderDeAtaquePersonaje2 = this.jugador2.getPoderDeAtaque(this.personaje2) * this.numeroAlAzar
		this.jugar()
	}
	
	def numeroAlAzar(){
		return Math.round(Math.random()*1).intValue
	}
	
	def void cancelarDuelo(){
		juego.terminoDuelo(this)
	}
	
	def void retarAMRX(){
		this.jugador2 = new Jugador_MR_X("MR_X", this.juego)
		this.personaje2 = this.jugador2.getPersonajeAlazar()
		this.jugar()
	}

	def void luchar(){
		if(this.poderDeAtaquePersonaje1 > this.poderDeAtaquePersonaje2){
			this.resultadoJugador1 = new Resultado(true,this.personaje1,this.posicionPersonaje1,true,false)
			this.resultadoJugador2 = new Resultado(false,this.personaje2,this.posicionPersonaje2,false,false)
		}
		else{
			if(this.poderDeAtaquePersonaje1 < this.poderDeAtaquePersonaje2){
				this.resultadoJugador1 = new Resultado(true,this.personaje1,this.posicionPersonaje1,false,false)
				this.resultadoJugador2 = new Resultado(false,this.personaje2,this.posicionPersonaje2,true,false)
			}
			else{
				this.resultadoJugador1 = new Resultado(true,this.personaje1,this.posicionPersonaje1,false,true)
				this.resultadoJugador2 = new Resultado(false,this.personaje2,this.posicionPersonaje2,false,true)
			}
		}
	}
	
	def void jugar(){
		this.luchar()
		this.guardarResultado()
		this.actualizarLosPuntajes()
	}
	
	def guardarResultado(){
		this.jugador1.agregarResultado(this.resultadoJugador1)
		this.jugador2.agregarResultado(this.resultadoJugador2)
	}
	
	def void actualizarLosPuntajes(){
		this.jugador1.actualizarPuntaje()
		this.jugador2.actualizarPuntaje()
	}
}