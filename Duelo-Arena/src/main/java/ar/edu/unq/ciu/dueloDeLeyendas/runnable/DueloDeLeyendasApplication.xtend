package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext

class DueloDeLeyendasApplication extends Application{
	
	static def void main(String[] args){
		new DueloDeLeyendasApplication().start()
	}
	
	override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Modelo), new HomeModelos)
		ApplicationContext.instance.configureSingleton(typeof(Celular), new HomeCelulares)
		return new BuscarCelularesWindow(this)
	}
}