import calificacion.CentroDeCalificaciones
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

class TestPersonaje {
	
	var Juego juego
	var Jugador jugador01
	var Personaje personaje01
	var Duelo duelo
	var Estadisticas estadisticas
	var Posicion posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	
	
	@Before
	def void setUp() {
		this.posicionIdeal = new Jungle
		this.estadisticas = new Estadisticas(/*personaje01,*/centroDeCalificaciones)
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.juego = new Juego()
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,estadisticas)
		this.duelo = new Duelo(jugador01,juego)
		
	}
	
	@Test
	def actualizarPoderDeAtaque() {
		Assert::assertEquals(5,this.personaje01.actualizarPoderDeAtaque())
	}
	
	@Test
	def poderDeAtaque() {
		//Assert::assertEquals(5,this.personaje01.poderDeAtaque())
	}
	
	@Test
	def actualizarEstadisticas() {
		
	}
}