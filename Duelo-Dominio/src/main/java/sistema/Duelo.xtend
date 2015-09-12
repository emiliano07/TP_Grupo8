package sistema

import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@ Accessors class Duelo {
	
	var Sistema sistema
	var Jugador jugador1		//Jugador que inicio el Duelo
	var Jugador jugador2		//Jugador contrincante
	var Personaje personaje1	//Personaje del Jugador 1
	var Personaje personaje2	//Personaje del Jugador 2
	var int ganador				//0 -> Comienza //1 o 2 -> Dependendiendo quien gano el duelo // 3 -> En caso de empate
	
	new(Jugador jugador1){
		this.jugador1 = jugador1
		this.jugador2 = null
		this.personajeGanador = 0
		this.personaje1 = null
		this.personaje2 = null
	}
	
	def seleccionarPersonaje(Personaje personaje1){
		this.personaje1 = personaje1;
	}
	
	def seleccionarPosicion(Posicion posicion){
		this.personaje1.setPosicionActual(posicion)
		this.sistema.buscarContrincante(this)
		this.jugar()
	}
	
	def void cancelarDuelo(){
		this.sistema.terminoDuelo(this)
	}
	
	def retarAMRX(){
		this.jugador2 = new Jugador_MR_X("MR_X", this.sistema)
		this.personaje2 = this.jugador2.getPersonajeAlazar()
		this.jugar()
	}

	def luchar(){		
		switch  personaje1{
		case personaje1.getPoderDeAtaque()>this.personaje2.getPoderDeAtaque() : this.personajeGanador = 1
		case personaje1.getPoderDeAtaque()<this.personaje2.getPoderDeAtaque(): this.personajeGanador = 2
		case personaje1.getPoderDeAtaque()== this.personaje2.getPoderDeAtaque(): this.personajeGanador = 3
	}
}
	def jugar(){
		this.luchar()
		this.actualizarHistorialesDeResultados()
		this.actualizarEstadisticas()
		this.actualizarPoderDeAtaque()
		this.actualizarRanking()
	}
	
	def actualizarHistorialesDeResultados(){
		this.jugador1.agregarNuevoResultado(new Resultado(true,this.personaje1,this.personaje1.getPosicionActual(),this.personajeGanador))
		this.jugador2.agregarNuevoResultado(new Resultado(false,this.personaje2,this.personaje2.getPosicionActual(),this.personajeGanador))
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
}