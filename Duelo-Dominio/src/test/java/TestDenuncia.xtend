import calificacion.CentroDeCalificaciones
import denuncia.FeedIntencional
import juego.Duelo
import juego.Juego
import juego.Personaje
import jugador.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle
import posicion.Posicion

class TestDenuncia {
	
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Personaje personaje01
	var Duelo duelo
	var Posicion posicionIdeal
	var FeedIntencional feed
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
		this.feed = new FeedIntencional(jugador01,jugador02)
		
	}
	
	@Test
	def analizarDenunciaYSeLeAplicaAlDenunciado() {
		this.feed.descripcion = "Una descripcion"
		this.feed.denunciado = jugador02
		this.feed.denunciante = jugador01
		this.feed.analizarDenuncia()
		Assert::assertEquals(1,this.jugador01.denuncias.size())
	}
	
	@Test
	def analizarDenunciaYSeLeAplicaAlDenunciante() {
		this.feed.descripcion = "Una descripcion de una denuncia"
		this.feed.denunciado = jugador02
		this.feed.denunciante = jugador01
		this.feed.analizarDenuncia()
		Assert::assertEquals(1,this.jugador02.denuncias.size())
	}
}