import juego.Duelo
import juego.Estadisticas
import juego.Juego
import juego.Jugador
import juego.Personaje
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle
import posicion.Posicion
import posicion.Top
import calificacion.CentroDeCalificaciones

class TestDuelo {
	
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Personaje personaje01
	var Duelo duelo
	var Estadisticas estadisticas
	var Posicion posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	
	
	@Before
	def void setUp() {
		this.posicionIdeal = new Jungle
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.estadisticas = new Estadisticas(/*personaje01,*/centroDeCalificaciones)
		this.juego = new Juego()
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.jugador02 = new Jugador("Jugador 02",juego)
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,estadisticas)
		this.duelo = new Duelo(jugador01,juego)
		
	}
	
	@Test 
	def seleccionarPosicion() {
		var top = new Top
		this.personaje01.poderDeAtaque = 10
		this.juego.jugadores.add(jugador02)
		this.juego.personajesActivados.add(personaje01)
		this.duelo.seleccionarPersonaje(personaje01)
		this.duelo.seleccionarPosicion(top)
		Assert::assertEquals(top.nombre,this.personaje01.posicionActual.nombre)
	}
	
	
}