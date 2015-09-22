import calificacion.CentroDeCalificaciones
import juego.Duelo
import juego.Juego
import juego.Personaje
import jugador.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle
import posicion.Posicion
import posicion.Top

class TestDuelo {
	
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Personaje personaje01
	var Duelo duelo
	var Posicion posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	
	@Before
	def void setUp() {
		this.posicionIdeal = new Jungle
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.juego = new Juego()
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.jugador02 = new Jugador("Jugador 02",juego)
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,centroDeCalificaciones)
		this.duelo = new Duelo(jugador01,juego)
	}
	
	@Test 
	def seleccionarPosicion() {
		var top = new Top
		this.juego.agregarJugador(jugador01)
		this.juego.agregarJugador(jugador02)
		this.juego.agregarPersonaje(personaje01)
		this.duelo.seleccionarPersonaje(personaje01)
		Assert::assertEquals(jugador01.nombre,this.duelo.jugador1.nombre)
		Assert::assertEquals(personaje01.nombre,this.duelo.personaje1.nombre)
		Assert::assertEquals(1,juego.posiblesRivales(jugador01).size())
		Assert::assertEquals(jugador02.nombre,juego.posiblesRivales(jugador01).get(0).nombre)
		this.duelo.seleccionarPosicion(top)
		Assert::assertEquals(top.nombre,this.personaje01.posicionActual.nombre)
		Assert::assertEquals(jugador02.nombre,duelo.jugador2.nombre)
		Assert::assertEquals(duelo.personaje2.nombre,personaje01.nombre)
		Assert::assertEquals(duelo.personaje2.posicionIdeal,duelo.personaje2.posicionActual)
	}
}