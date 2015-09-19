package ar.edu.unq.ciu.dueloDeLeyendas.ui.AplicarDenuncia

import juego.Jugador
import org.uqbar.arena.windows.WindowOwner

class HasSidoSancionadoWindow extends Denunciador{
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, 
			  jugador,
			''' Hemos detectado que tu denuncia no tiene fundamentos sólidos.
			En duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play.
			Con lo que has recibido una sanción por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud
			'''
			  , "Has sido sancionado!")
	}
}