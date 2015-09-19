package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import ar.edu.unq.ciu.dueloDeLeyendas.ui.NoTienesRivalWindow
import calificacion.CentroDeCalificaciones
import denuncia.FeedIntencional
import juego.Duelo
import juego.Estadisticas
import juego.Juego
import juego.Jugador
import juego.Personaje
import org.uqbar.arena.Application
import posicion.Jungle
import posicion.Posicion

class DueloDeLeyendasApplication extends Application{
	var Jugador jugador01
	var Jugador jugador02
	var Juego	juego
	var Personaje personaje01
	var Personaje personaje02
	var FeedIntencional feed
	var Posicion posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	var Estadisticas estadisticas01
	var Estadisticas estadisticas02
	var Duelo duelo
	
	def setUp() {
		this.posicionIdeal = new Jungle
		this.estadisticas01 = new Estadisticas(centroDeCalificaciones)
		this.estadisticas02 = new Estadisticas(centroDeCalificaciones)
		this.juego = new Juego
		this.personaje01 = new Personaje("Iron Man","debilidades", "especialidades",posicionIdeal,estadisticas01)
		this.personaje02 = new Personaje("Iron Man","debilidades", "especialidades",posicionIdeal,estadisticas02)
		this.jugador01 = new Jugador("Emiliano",juego)
		this.jugador02 = new Jugador("Lucio",juego)
		this.duelo = new Duelo(jugador01,juego)
		this.duelo.jugador2 = jugador02
		this.duelo.personaje1 = personaje01
		this.duelo.personaje2 = personaje02
	
		
		
		///////////////////////////////////////////////77
		/* 
		this.juego.agregarJugador(this.jugador01)
		this.juego.agregarJugador(this.jugador02)
		this.juego.agregarPersonaje(personaje01)
		this.juego.agregarPersonaje(personaje02)
		
		this.feed = new FeedIntencional()
		this.feed.denunciado = jugador02
		this.feed.denunciante = jugador01*/
		
	}
	def static void main(String[] args){
		new DueloDeLeyendasApplication().start()
	}
	
	override createMainWindow() {
		this.setUp
		this.juego.personajesActivados.add(personaje01)
		this.jugador01.personajesUsados.add(personaje01)
		this.jugador01.dueloActivo = duelo
		
		//new HacerDenunciaWindow(this, new DenunciaApplicacionModel(feed.denunciado,feed))
		//new ResultadoWindow(this,new DueloApplicationModel(duelo))
		new NoTienesRivalWindow(this,jugador01)
	}
}