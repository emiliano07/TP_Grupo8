import calificacion.CentroDeCalificaciones
import denuncia.FeedIntencional
import juego.Duelo
import juego.Juego
import juego.NoHayContrincanteException
import juego.Personaje
import jugador.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle
import posicion.Mid
import posicion.Posicion

class TestJugador {
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Personaje personaje01
	var Personaje personaje02
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
		this.personaje02= new Personaje("Personaje 02","debilidades", "especialidades",posicionIdeal,centroDeCalificaciones)
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
	def getPersonajeAlazar() {
		this.jugador01.personajesUsados.add(personaje01)
		Assert::assertEquals(personaje01.nombre,this.jugador01.getPersonajeAlazar().nombre)
		this.jugador01.personajesUsados.remove(personaje01)
		this.juego.agregarPersonaje(personaje02)
		this.juego.agregarJugador(jugador01)
		var int i = Math.round(Math.random()*(this.jugador01.personajesParaUsar.size()-1)).intValue
		Assert::assertEquals(0,i)
		Assert::assertEquals(personaje02.nombre,this.jugador01.getPersonajeAlazar().nombre)
	}
	
	@Test 
	def actualizarPuntaje() {
		var feed = new FeedIntencional(jugador01,jugador02)
		this.jugador01.denuncias.add(feed)
		Assert::assertEquals(0,this.jugador01.actualizarPuntaje())
	}
	
	@Test
	def agregarNuevaDenuncia() {
		var feed = new FeedIntencional (jugador01,jugador02)
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
		this.juego.personajes.add(personaje02)
		this.jugador01.retarAMRX(duelo)
		Assert::assertEquals("MR_X",this.duelo.jugador2.nombre)
	}
	
	@Test
	def seleccionarPosicionYJugar() {
		var mid = new Mid
		this.juego.jugadores.add(jugador02)// agrego al jugador02 a la lista de jugadores
		this.jugador02.personajesUsados.add(personaje02)//agrego al personaje02 para que se le setee al jugador02 ese personaje
		this.jugador01.seleccionarPersonaje(duelo,personaje01) //al jugador01 le setee el personaje01 
		this.jugador01.seleccionarPosicion(duelo,mid)//selecciona la posocion y busca un contrincante para pelear
		//si se seteo correctacmente al personaje01 la posicion mid en la posicion actual
		Assert::assertEquals("Mid",this.duelo.personaje1.posicionActual.nombre)
		//cuando busca contrincante si se setea bien el jugador2 y personaje2
		Assert::assertEquals(jugador02.nombre,this.duelo.jugador2.nombre)
		Assert::assertEquals(personaje02.nombre,this.duelo.personaje2.nombre)
		//En este momento hay un empate
		Assert::assertEquals("Jugador creado en caso de empate",this.duelo.getJugadorGanador.nombre)
		// Verifico que se haya actualizado las estadisticas, en este caso que se le sume a ambos 
		// personajes un assist
		Assert::assertEquals(1,this.personaje01.estadisticas.assists)
		Assert::assertEquals(1,this.personaje02.estadisticas.assists)
	}
	
	@Test (expected = NoHayContrincanteException )
	def seleccionarPosicionYNoHayContrincante() throws Exception {
		var mid = new Mid
		this.jugador01.seleccionarPersonaje(duelo,personaje01) 
		this.jugador01.seleccionarPosicion(duelo,mid)
		Assert.fail()
	}
}