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
	String aceptarButton
	
	new(Duelo duelo) {
		this.duelo = duelo
		this.resultado = ""
		this.ganador = ""
		this.aceptarButton = "Aceptar"
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
		if (this.duelo.resultadoJugador1.ganeDuelo){
			this.ganador = this.duelo.getJugador1().getNombre()
			this.resultado = "Le ganaste a " + this.getRetado()
			this.aceptarButton = "Aceptar"
		}else{
			if(this.duelo.resultadoJugador2.ganeDuelo){
				this.ganador = this.duelo.getJugador2().getNombre()
				this.resultado = "Perdiste contra " + this.getRetado()
				this.aceptarButton = "Aceptar derrota con honor"
			}else{
				this.ganador = "Empate"
				this.resultado = "Empataste con " + this.getRetado()
				this.aceptarButton = "Aceptar"
			}
		}
	}
	
	def Estadisticas getEstadisticasRetado(){
		this.duelo.jugador2.estadisticas
	}
	
	def Estadisticas getEstadisticasRetador(){
		this.duelo.jugador1.estadisticas
	}
	
	def puntosRetador(){
		this.duelo.poderDeAtaquePersonaje1
	}
	
	def puntosRetado(){
		this.duelo.poderDeAtaquePersonaje2
	}
}