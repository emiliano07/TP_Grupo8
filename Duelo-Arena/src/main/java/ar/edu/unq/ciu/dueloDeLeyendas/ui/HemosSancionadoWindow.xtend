package ar.edu.unq.ciu.dueloDeLeyendas.ui

import jugador.Jugador
import org.uqbar.arena.windows.WindowOwner

class HemosSancionadoWindow  extends Denunciador {
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, 
			  jugador,
			''' 
			En duelo de leyendas somos partidarios del fair play.
			Gracias por ayudarnos a mantenernos así!!!
			'''
			  , " Hemos sansionado a " + jugador.nombre )
	}
}