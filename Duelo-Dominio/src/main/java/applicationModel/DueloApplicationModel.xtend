package applicationModel

import juego.Duelo
import juego.Estadisticas
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
	
	def void resultadoRetador(){
		var String ganador = this.duelo.getJugadorGanador().getNombre()
		if (ganador == this.getRetador()){
			this.ganador = ganador
			this.resultado = "Le ganaste a " + this.getRetado()
		}else{
			if(ganador == this.getRetado()){
				this.ganador = ganador
				this.resultado = "Perdiste contra " + this.getRetado()
			}else{
				this.ganador = "Empate"
				this.resultado = "Empataste con " + this.getRetado()
			}
		}
	}
	
	def Estadisticas getEstadisticasRetado(){
		this.duelo.personaje2.estadisticas
	}
	
	def Estadisticas getEstadisticasRetador(){
		this.duelo.personaje1.estadisticas
	}
	
	def puntosRetador(){
		this.duelo.poderDeAtaquePersonaje1
	}
	
	def puntosRetado(){
		this.duelo.poderDeAtaquePersonaje2
	}
}