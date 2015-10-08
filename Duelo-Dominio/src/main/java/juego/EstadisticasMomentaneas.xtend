package juego

import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import java.util.List
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class EstadisticasMomentaneas {
	
	var int cantUsado					//Cantidad de veces que lo uso para iniciar un Duelo
	var int cantGanado 					//Cantidad de veces que gano un Duelo
	var int kills						//Cantidad de Duelos que gano que no fueron inicializados por el Jugador
	var int deads						//Cantidad de Duelos que perdio que no fueron inicializados por el Jugador
	var int assists						//Cantidad de Duelos que empato (iniciados o no por el Jugador)
	var List<Posicion> posiciones		//Posiciones en las que un Jugador inicio un Duelo
	var Posicion mejorUbicacion			//La ultima Posicion en la que gano un Duelo
	var Calificacion calificacion		//Ultima Calificacion obtenida por el Personaje en un Duelo}

	new(Estadisticas estadisticas, Personaje personaje, Jugador jugador, CentroDeCalificaciones centroDeCalificaciones){
		this.cantUsado = estadisticas.getCantUsado(personaje)
		this.cantGanado = estadisticas.getCantGanado(personaje)
		this.kills = estadisticas.getKills(personaje)
		this.deads = estadisticas.getDeads(personaje)
		this.assists = estadisticas.getAssists(personaje)
		this.posiciones = estadisticas.getPosicionesEnLasQueInicioUnDuelo(personaje)
		this.mejorUbicacion = estadisticas.getMejorUbicacion(personaje)
		this.calificacion = estadisticas.getCalificacion(jugador, personaje, centroDeCalificaciones)
	}
}