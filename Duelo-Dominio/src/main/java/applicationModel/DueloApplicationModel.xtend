package applicationModel

import juego.Duelo
import juego.Estadisticas
import juego.No_Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DueloApplicationModel {
	
	Duelo duelo
	String resultado
	String ganador
	
	new(Duelo duelo) {
		this.duelo = duelo
		this.resultado = ""
	}
	
	def String getRetador() {
		this.duelo.jugador1.nombre
	}
	
	def String getRetado() {
		this.duelo.jugador2.nombre
	}
	
	def String getPersonajeRetador() {
		this.duelo.personaje1.nombre
	}
	
	def String getPersonajeRetado() {
		this.duelo.personaje2.nombre
	}
	
	def resultadoRetador(){
		var String ganador = this.duelo.getJugadorGanador().getNombre()
		switch ganador {
		case ganador == this.getRetador() : this.resultado = "Le ganaste a " + this.getRetado() : this.ganador = ganador
		case ganador == this.getRetado() : this.resultado = "Perdiste contra " + this.getRetado() : this.ganador = ganador
		case ganador == new No_Jugador("Jugador creado en caso de empate", this.duelo.getJugador1().getJuego()) : this.resultado = "Empataste con " + this.getRetado() : this.ganador = "Empate"
		}
	}
	
	def Estadisticas getEstadisticasRetado(){
		this.duelo.personaje2.estadisticas
	}
	
	def Estadisticas getEstadisticasRetador(){
		this.duelo.personaje1.estadisticas
	}
	
	def puntosRetador(){
		this.duelo.poderDeAtaquePersonje1
	}
	
	def puntosRetado(){
		this.duelo.poderDeAtaquePersonje2
	}
}