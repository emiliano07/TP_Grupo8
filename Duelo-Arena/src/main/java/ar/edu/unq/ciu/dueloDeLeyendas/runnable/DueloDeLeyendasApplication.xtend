package ar.edu.unq.ciu.dueloDeLeyendas.runnable

import applicationModel.JugadorApplicationModel
import ar.edu.unq.ciu.dueloDeLeyendas.ui.RetarADueloWindow
import calificacion.CentroDeCalificaciones
import juego.Estadisticas
import juego.Juego
import juego.Jugador
import juego.Personaje
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
		//Posiciones
		var posicionJungle = new Jungle
		var posicionMid = new Mid
		var posicionTop = new Top
		var posicionBot = new Bot
		
		//Debilidades Personajes
		var debilidadesPersonaje01 = "Lento"
		var debilidadesPersonaje02 = "Poca fuerza al golpear"
		var debilidadesPersonaje03 = "Agresividad baja"
		var debilidadesPersonaje04 = "Volar"
		
		//Especialidades Personajes
		var especialidadesPersonaje01 = "Veloz"
		var especialidadesPersonaje02 = "Golpe letal"
		var especialidadesPersonaje03 = "Camuflaje"
		var especialidadesPersonaje04 = "Incapacitación, para dejarlos inútiles"
		
		//Juego
		var juego = new Juego
		
		// CentroDeCalificaciones
		var centroDeCalificaciones = new CentroDeCalificaciones
		
		//Estadisticas
		var estadisticas = new Estadisticas(null,centroDeCalificaciones) //Fijarse si que hacer con el personajeAQuePertenece
		
		//Personajes
		var personaje01 = new Personaje("Mr_X",debilidadesPersonaje01,especialidadesPersonaje01,posicionJungle,estadisticas )
		var personaje02 = new Personaje("Mr_Y",debilidadesPersonaje02,especialidadesPersonaje02,posicionBot,estadisticas )
		var personaje03 = new Personaje("Mr_Z",debilidadesPersonaje03,especialidadesPersonaje03,posicionMid,estadisticas )
		var personaje04 =new Personaje("Mr_T",debilidadesPersonaje04,especialidadesPersonaje04,posicionTop,estadisticas )
		
		//Jugadores
		var jugador01 = new Jugador("Emiliano", juego)
		var jugador02 = new Jugador("Lucio", juego)
		var jugador03 = new Jugador("Pedro", juego)
		var jugador04 = new Jugador("Ezequiel", juego)
		
		//Agrego al juego los personajes y jugadores
		juego.agregarPersonaje(personaje01)
		juego.agregarPersonaje(personaje02)
		juego.agregarPersonaje(personaje03)
		juego.agregarPersonaje(personaje04)
		juego.agregarJugador(jugador01)
		juego.agregarJugador(jugador02)
		juego.agregarJugador(jugador03)
		juego.agregarJugador(jugador04)
		
		//Agrego al juego los personajes activados, es decir, los que los jugadores pueden usar
		juego.activarPersonaje(personaje01)
		juego.activarPersonaje(personaje02)
		juego.activarPersonaje(personaje03)
		juego.activarPersonaje(personaje04)
		
		//Cuando se reta a duelo el que lo hace es el jugador01
		jugador01.personajesUsados.add(personaje01)
		jugador01.personajesUsados.add(personaje02)
		jugador01.personajesUsados.add(personaje03)
		jugador01.personajesUsados.add(personaje04)
		jugador01.iniciarDuelo()
		//jugador01.seleccionarPersonaje(jugador01.dueloActivo,personaje01)
		personaje01.estadisticas.setPersonajeAlQuePertenece(personaje01)//ARREGLAR
		
		new RetarADueloWindow(this, new JugadorApplicationModel(jugador01))
	}
}