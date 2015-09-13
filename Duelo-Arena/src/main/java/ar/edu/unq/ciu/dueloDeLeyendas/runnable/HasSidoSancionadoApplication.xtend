package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import ar.edu.unq.ciu.dueloDeLeyendas.ui.HasSidoSancionadoWindow
import org.uqbar.arena.Application
import sistema.Jugador

class HasSidoSancionadoApplication extends Application{
	
	def static void main(String[] args){
		new HacerDenunciaApplication().start()
	}
	
	override createMainWindow() {
		new HasSidoSancionadoWindow(this, new Jugador())
	}
}