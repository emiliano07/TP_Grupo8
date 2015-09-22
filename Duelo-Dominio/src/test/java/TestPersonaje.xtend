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

class TestPersonaje {
	
	var Juego juego
	var Jugador jugador01
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
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,centroDeCalificaciones)
		this.duelo = new Duelo(jugador01,juego)
		
	}
	
	@Test
	def actualizarPoderDeAtaque() {
		this.personaje01.actualizarPoderDeAtaque()
		Assert::assertEquals(5,this.personaje01.poderDeAtaque)
	}
}