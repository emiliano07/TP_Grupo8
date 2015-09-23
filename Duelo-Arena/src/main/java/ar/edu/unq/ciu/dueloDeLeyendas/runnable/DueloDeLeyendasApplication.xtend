package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import applicationModel.JugadorApplicationModel
import ar.edu.unq.ciu.dueloDeLeyendas.ui.RetarADueloWindow
import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import calificacion.Dominador
import calificacion.Killing_Spread
import calificacion.Manco
import calificacion.Nooob
import calificacion.Rampage
import juego.Juego
import juego.Personaje
import jugador.Jugador
import org.uqbar.arena.Application
import posicion.Bot
import posicion.Jungle
import posicion.Mid
import posicion.Top

class DueloDeLeyendasApplication extends Application{
	
	
	def static void main(String[] args){
		new DueloDeLeyendasApplication().start()
	}
	
	override createMainWindow() {
		
		//Calificaciones
		var Calificacion nooob = new Nooob
		var Calificacion manco = new Manco
		var Calificacion killing = new Killing_Spread
		var Calificacion dominador = new Dominador
		var Calificacion rampage = new Rampage
		
		//Posiciones
		var posicionJungle = new Jungle
		var posicionMid = new Mid
		var posicionTop = new Top
		var posicionBot = new Bot
		
		//Especialidades Personajes
		var especialidadesPersonaje01 = "Kame-Kame-Ha"
		var especialidadesPersonaje02 = "Big Bang Attack"
		var especialidadesPersonaje03 = "Masenko"
		var especialidadesPersonaje04 = "Burning Attack"
		
		//Debilidades Personajes
		var debilidadesPersonaje01 = "Confiado"
		var debilidadesPersonaje02 = "Orgulloso"
		var debilidadesPersonaje03 = "Poca confianza"
		var debilidadesPersonaje04 = "Ingenuo"
		
		// CentroDeCalificaciones
		var centroDeCalificaciones = new CentroDeCalificaciones
	
		//Agrego al Centro de calificaciones las calificaciones posibles
		centroDeCalificaciones.agregarCalificacion(nooob)
		centroDeCalificaciones.agregarCalificacion(manco)
		centroDeCalificaciones.agregarCalificacion(killing)
		centroDeCalificaciones.agregarCalificacion(dominador)
		centroDeCalificaciones.agregarCalificacion(rampage)
		
		//Juego
		var juego = new Juego()
			
		//Personajes
		var personaje01 = new Personaje("Goku",debilidadesPersonaje01,especialidadesPersonaje01,posicionJungle,centroDeCalificaciones )
		var personaje02 = new Personaje("Vegeta",debilidadesPersonaje02,especialidadesPersonaje02,posicionBot,centroDeCalificaciones )
		var personaje03 = new Personaje("Gohan",debilidadesPersonaje03,especialidadesPersonaje03,posicionMid,centroDeCalificaciones )
		var personaje04 = new Personaje("Trunks",debilidadesPersonaje04,especialidadesPersonaje04,posicionTop,centroDeCalificaciones )
		
		//Agrego al juego los personajes
		juego.agregarPersonaje(personaje01)
		juego.agregarPersonaje(personaje02)
		juego.agregarPersonaje(personaje03)
		juego.agregarPersonaje(personaje04)
		
		//Jugadores
		var jugador01 = new Jugador("Emiliano", juego)
		var jugador02 = new Jugador("Lucio", juego)
		var jugador03 = new Jugador("Pedro", juego)
		var jugador04 = new Jugador("Ezequiel", juego)
		
		//Agrego al juego los jugadores
		//////////////////////////////////////////////////////////////////////////////////////////////
		// Para probar de retar a MR_X se debe deshabilitar la opción uno y habilitar la opción dos //
		//////////////////////////////////////////////////////////////////////////////////////////////
		//OPCIÓN UNO
		juego.agregarJugador(jugador01)
		juego.agregarJugador(jugador02)
		juego.agregarJugador(jugador03)
		juego.agregarJugador(jugador04)
		//OPCIÓN DOS
		//juego.agregarJugador(jugador01)	
		/////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		//Cuando se reta a duelo el que lo hace es el jugador01
		jugador01.iniciarDuelo()
		
		new RetarADueloWindow(this, new JugadorApplicationModel(jugador01))
	}
}