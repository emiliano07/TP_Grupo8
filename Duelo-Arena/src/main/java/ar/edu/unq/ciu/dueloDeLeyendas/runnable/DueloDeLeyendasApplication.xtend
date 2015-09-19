package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import applicationModel.JugadorApplicationModel
import ar.edu.unq.ciu.dueloDeLeyendas.ui.RetarADueloWindow
import calificacion.CentroDeCalificaciones
import denuncia.FeedIntencional
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
	
	def setUp() {
		this.posicionIdeal = new Jungle
		this.juego = new Juego
		this.centroDeCalificaciones = new CentroDeCalificaciones()
		this.personaje01 = new Personaje("Iron Man","debilidades", "especialidades",posicionIdeal,new Estadisticas(this.personaje01, centroDeCalificaciones))
		this.personaje02 = new Personaje("Iron Man","debilidades", "especialidades",posicionIdeal,new Estadisticas(this.personaje02, centroDeCalificaciones))
		this.jugador01 = new Jugador("Emiliano",juego)
		this.jugador02 = new Jugador("Lucio",juego)
					
		this.juego.agregarJugador(this.jugador01)
		this.juego.agregarJugador(this.jugador02)
		this.juego.agregarPersonaje(personaje01)
		this.juego.agregarPersonaje(personaje02)
		
		this.feed = new FeedIntencional(jugador01, jugador02)
		
	}
	
	def static void main(String[] args){
		new DueloDeLeyendasApplication().start()
	}
	
	override createMainWindow() {
		this.setUp
		this.juego.personajesActivados.add(personaje01)
		this.jugador01.personajesUsados.add(personaje01)
		this.jugador01.iniciarDuelo()
		this.jugador01.seleccionarPersonaje(this.jugador01.dueloActivo, this.personaje01)
		this.personaje01.estadisticas.setPersonajeAlQuePertenece(this.personaje01)
		
		//new HacerDenunciaWindow(this, new DenunciaApplicacionModel(jugador01,jugador02))
		//new ResultadoWindow(this,new DueloApplicationModel(duelo))
		//new NoTienesRivalWindow(this,jugador01)
		new RetarADueloWindow(this, new JugadorApplicationModel(jugador01))
	}
}