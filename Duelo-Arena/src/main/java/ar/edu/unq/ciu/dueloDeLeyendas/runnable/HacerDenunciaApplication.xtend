package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import ar.edu.unq.ciu.dueloDeLeyendas.ui.HacerDenunciaWindow
import org.uqbar.arena.Application
import sistema.Jugador

class HacerDenunciaApplication extends Application{
	
	def static void main(String[] args){
		new HacerDenunciaApplication().start()
	}
	
	override createMainWindow() {
		new HacerDenunciaWindow(this, new Jugador())
	}
}