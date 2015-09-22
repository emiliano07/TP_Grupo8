package juego

import jugador.Jugador
import jugador.Jugador_MR_X
import jugador.No_Jugador
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
	var Jugador jugadorGanador		//Jugador que resulta ganador, en caso de empate aparece un No_Jugador
	
	new(Jugador jugador1, Juego juego){
		this.juego = juego
		this.jugador1 = jugador1
		this.jugador2 = null
		this.personaje1 = null
		this.personaje2 = null
		this.poderDeAtaquePersonaje1 = 0
		this.poderDeAtaquePersonaje2 = 0
		this.jugadorGanador = null
	}
	
	def void seleccionarPersonaje(Personaje personaje1){
		this.personaje1 = personaje1;
	}
	
	def void seleccionarPosicion(Posicion posicion){
		this.personaje1.setPosicionActual(posicion)
		this.juego.buscarContrincante(this)
		this.personaje2.setPosicionActual(this.personaje2.getPosicionIdeal())
		this.poderDeAtaquePersonaje1 = this.personaje1.getPoderDeAtaque() * this.numeroAlAzar
		this.poderDeAtaquePersonaje2 = this.personaje2.getPoderDeAtaque() * this.numeroAlAzar
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
		this.jugador2.cargarPersonajesParaUsar()
		this.personaje2 = this.jugador2.getPersonajeAlazar()
		this.jugar()
	}

	def void luchar(){
		if(this.poderDeAtaquePersonaje1 > this.poderDeAtaquePersonaje2){
			this.jugadorGanador = this.jugador1
		}
		else{
			if(this.poderDeAtaquePersonaje1 < this.poderDeAtaquePersonaje2){
				this.jugadorGanador = this.jugador2
			}
			else{
				this.jugadorGanador = new No_Jugador("Jugador creado en caso de empate", this.jugador1.getJuego()) //En caso de empate devuelve un No_Jugador
			}
		}
	}
	
	def void jugar(){
		this.luchar()
		this.actualizarPersonajesUsados()
		this.actualizarEstadisticas()
		this.actualizarPoderDeAtaque()
		this.actualizarLosPuntajes()
	}
	
	def void actualizarEstadisticas(){
		this.personaje1.actualizarEstadisticas(this)
		this.personaje2.actualizarEstadisticas(this)
	}
	
	def void actualizarPoderDeAtaque(){
		this.personaje1.actualizarPoderDeAtaque()
		this.personaje2.actualizarPoderDeAtaque()
	}
	
	def void actualizarPersonajesUsados(){
		this.jugador1.actualizarPersonajesUsados(personaje1)
		this.jugador2.actualizarPersonajesUsados(personaje2)
	}
	
	def void actualizarLosPuntajes(){
		this.jugador1.actualizarPuntaje()
		this.jugador2.actualizarPuntaje()
	}
}