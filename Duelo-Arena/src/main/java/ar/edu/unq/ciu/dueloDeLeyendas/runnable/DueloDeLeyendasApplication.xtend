package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import ar.edu.unq.ciu.dueloDeLeyendas.ui.HacerDenunciaWindow
import denuncia.FeedIntencional
import juego.ApplicacionModel
import juego.Juego
import juego.Jugador
import juego.Personaje
import org.uqbar.arena.Application

class DueloDeLeyendasApplication extends Application{
	var Jugador jugador01
	var Jugador jugador02
	var Juego	juego
	var Personaje personaje
	var FeedIntencional feed
	
	def setUp() {
		this.personaje = new Personaje("Iron Man")
		this.juego = new Juego
		this.juego.agregarJugador(this.jugador01)
		this.juego.agregarJugador(this.jugador02)
		this.juego.agregarPersonaje(personaje)
		this.jugador01 = new Jugador("Emiliano",juego)
		this.jugador02 = new Jugador("Lucio",juego)
		this.feed = new FeedIntencional()
		this.feed.denunciado = jugador02
		this.feed.denunciante = jugador01
		
	}
	def static void main(String[] args){
		new DueloDeLeyendasApplication().start()
	}
	
	override createMainWindow() {
		this.setUp
		new HacerDenunciaWindow(this, new ApplicacionModel(feed.denunciado,feed))
	}
}