import calificacion.CentroDeCalificaciones
import denuncia.FeedIntencional
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
import posicion.Mid

class TestJugador {
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Personaje personaje01
	var Personaje personaje02
	var Duelo duelo
	var Estadisticas estadisticas
	var Posicion posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	
	
	@Before
	def void setUp() {
		this.posicionIdeal = new Jungle
		this.estadisticas = new Estadisticas(personaje01,centroDeCalificaciones)
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.juego = new Juego()
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.jugador02 = new Jugador("Jugador 02",juego)
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,estadisticas)
		this.personaje02= new Personaje("Personaje 02","debilidades", "especialidades",posicionIdeal,estadisticas)
		this.duelo = new Duelo(jugador01,juego)
		
	}
	
	@Test 
	def iniciarDuelo() {
		this.jugador01.iniciarDuelo()
		Assert::assertEquals(1,this.juego.duelosActivos.size())
	}
	
	@Test 
	def seleccionarPersonaje() {
		this.duelo.personaje1 = personaje01
		this.jugador01.seleccionarPersonaje(duelo, personaje01)
		Assert::assertEquals(personaje01.nombre,this.duelo.personaje1.nombre)
	}
	
	 @Test
	def  getPersonajeAlazar() {
		this.jugador01.personajesUsados.add(personaje01)
		Assert::assertEquals(personaje01.nombre,this.jugador01.getPersonajeAlazar().nombre)
		this.jugador01.personajesUsados.remove(personaje01)
		this.juego.personajesActivados.add(personaje02)
		Assert::assertEquals(personaje02.nombre,this.jugador01.getPersonajeAlazar().nombre)
	}
	
	@Test 
	def actualizarPuntaje() {
		var feed = new FeedIntencional
		this.jugador01.denuncias.add(feed)
		Assert::assertEquals(0,this.jugador01.actualizarPuntaje())
	}
	
	@Test
	def agregarNuevaDenuncia() {
		var feed = new FeedIntencional
		this.jugador01.agregarNuevaDenuncia(feed)
		Assert::assertEquals(1,this.jugador01.denuncias.size())
	}
	
	@Test 
	def descansarEnMiGloria() {
		this.juego.duelosActivos.add(duelo)
		Assert::assertEquals(1,this.juego.duelosActivos.size())
		this.jugador01.descansarEnMiGloria(duelo)
		Assert::assertEquals(0,this.juego.duelosActivos.size())
	}
	
	@Test
	def retarAMRX() {
		this.jugador01.seleccionarPersonaje(duelo,personaje01)
		this.juego.personajesActivados.add(personaje02)
		this.jugador01.retarAMRX(duelo)
		Assert::assertEquals("MR_X",this.duelo.jugador2.nombre)
	}
	
	@Test
	def seleccionarPosicion() {
		var mid = new Mid
		this.personaje01.poderDeAtaque = 10
		this.personaje02.poderDeAtaque = 20
		this.personaje02.jugadorAlQuePertenece = jugador01
		this.juego.personajesActivados.add(personaje02)
		this.juego.jugadores.add(jugador02)
		this.jugador01.seleccionarPersonaje(duelo,personaje01)
		this.jugador01.seleccionarPosicion(duelo,mid)
		Assert::assertEquals("Mid",this.duelo.personaje1.posicionActual.nombre)
		Assert::assertEquals(jugador02.nombre,this.duelo.jugador2.nombre)
		Assert::assertEquals(this.personaje02.nombre,this.duelo.personajeGanador.nombre)
	}
	
	
}