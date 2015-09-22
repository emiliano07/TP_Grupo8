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

class TestJuego {
	
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
		this.juego = new Juego(centroDeCalificaciones)
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.jugador02 = new Jugador("Jugador 02",juego)
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,centroDeCalificaciones)
		this.duelo = new Duelo(jugador01,juego)
	}
	
	@Test
	def agregarPersonaje() {
		this.juego.agregarPersonaje(personaje01)
		Assert::assertEquals(1,this.juego.personajes.size())
	}
	
	@Test
	def nuevoDuelo() {
		this.juego.nuevoDuelo(duelo)
		Assert::assertEquals(1,this.juego.duelosActivos.size())
	}
	
	@Test
	def terminoDuelo() {
		this.juego.nuevoDuelo(duelo)
		Assert::assertEquals(1,this.juego.duelosActivos.size())
		this.juego.terminoDuelo(duelo)
		Assert::assertEquals(0,this.juego.duelosActivos.size())
	}
	
	@Test
	def eliminarPersonaje() {
		this.juego.agregarPersonaje(personaje01)
		Assert::assertEquals(1,this.juego.personajes.size())
		this.juego.eliminarPersonaje(personaje01)
		Assert::assertEquals(0,this.juego.personajes.size())
	}
	
	@Test
	def agregarJugador() {
		this.juego.agregarJugador(jugador01)
		Assert::assertEquals(1,this.juego.jugadores.size())
	}
	
	@Test
	def eliminarJugador() {
		this.juego.agregarJugador(jugador01)
		Assert::assertEquals(1,this.juego.jugadores.size())
		this.juego.eliminarJugador(jugador01)
		Assert::assertEquals(0,this.juego.jugadores.size())
	}
	
	@Test
	def ranking() {
		this.jugador01.puntaje = 18
		this.juego.agregarJugador(jugador01)
		this.jugador02.puntaje = 43
		this.juego.agregarJugador(jugador02)
		Assert::assertEquals(jugador02.nombre,this.juego.ranking.get(0).nombre)
	}
}