package sistema

import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors class Estadisticas {
	
	var Personaje personaje
	var CentroDeCalificaciones centroDeCalificaciones
	
	var int cantUsado					//Cantidad de veces que lo uso para iniciar un Duelo
	var int cantGanado //IDEAL???		//Cantidad de veces que gano un Duelo
	var int kills						//Cantidad de Duelos que gano que no fueron inicializados por el Jugador
	var int deads						//Cantidad de Duelos que perdio que no fueron inicializados por el Jugador
	var int assists						//Cantidad de Duelos que empato (iniciados o no por el Jugador)
	var ArrayList<Posicion> posiciones	//Posiciones en las que un Jugador inicio un Duelo
	var Posicion mejorUbicacion			//La ultima Posicion en la que gano un Duelo
	var Calificacion calificacion		//Ultima Calificacion obtenida por el Personaje en un Duelo
	
	var int ganadosEnPosicionIdeal
	var int perdidosEnPosicionIdeal
	var int ganadosEnPosicionNoIdeal
	var int perdidosEnPosicionNoIdeal
	
	new(){
		this.cantUsado = 0
		this.cantGanado = 0
		this.kills = 0
		this.deads = 0
		this.assists = 0
		this.posiciones = new ArrayList<Posicion>()
		this.mejorUbicacion = null					//No_Posicion?
		this.calificacion = null					//Np_Calificacion?
	}
	
	def actualizarEstadisticas(Duelo duelo) {
		if(duelo.getPersonaje1()==this.personaje){
			this.cantUsado ++
			this.posiciones.add(this.personaje.getPosicionActual())
			if(duelo.getGanador()==this){
				this.cantGanado ++
				this.mejorUbicacion = this.personaje.getPosicionActual()
			}
		}else{
			if(duelo.getGanador()==this){
				this.kills ++
				this.mejorUbicacion = this.personaje.getPosicionActual()
			}
			else
				this.deads ++
		}
		if(duelo.getGanador==null)
			this.assists ++
		this.calificacion = this.centroDeCalificaciones.actualizarCalificacion(this.calificacion, this)
	}
}