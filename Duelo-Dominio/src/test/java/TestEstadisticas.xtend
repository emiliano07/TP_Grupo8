import calificacion.CentroDeCalificaciones
import calificacion.Manco
import calificacion.Nooob
import juego.Duelo
import juego.Juego
import juego.Personaje
import jugador.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle

class TestEstadisticas {
	
	var Juego juego
	var Jugador jugador01
	var Personaje personaje01
	var Jugador jugador02
	var Personaje personaje02
	var Duelo duelo
	var Jungle posicionIdeal
	var CentroDeCalificaciones centroDeCalificaciones
	var Nooob nooob
	var Manco manco
		
	@Before
	def void setUp() {
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.nooob = new Nooob
		this.manco = new Manco
		this.centroDeCalificaciones.agregarCalificacion(nooob)
		this.centroDeCalificaciones.agregarCalificacion(manco)
		this.juego = new Juego()
		this.jugador01 = new Jugador("Jugador 01",juego)
		this.jugador02 = new Jugador("Jugador 02",juego)
		this.posicionIdeal = new Jungle
		this.personaje01 = new Personaje("Personaje 01","debilidades","especialidades",posicionIdeal,centroDeCalificaciones)
		this.personaje02 = new Personaje("Personaje 02","debilidades","especialidades",posicionIdeal,centroDeCalificaciones)
		this.juego.agregarJugador(jugador01)
		this.juego.agregarJugador(jugador02)
		this.jugador01.personajesParaUsar.add(personaje01)
		this.personaje01.jugadorAlQuePertenece = jugador01
		this.personaje02.jugadorAlQuePertenece = jugador02
		this.jugador02.personajesParaUsar.add(personaje02)
		this.duelo = new Duelo(jugador01,juego)
	}
	
	@Test
	def actualizarEstadisticas() {
		Assert::assertEquals("Nooob",centroDeCalificaciones.calificacionesPosibles.get(1).nombre)
		Assert::assertEquals("Manco",centroDeCalificaciones.calificacionesPosibles.get(0).nombre)
		duelo.jugador2 = jugador02
		duelo.personaje1 = personaje01
		duelo.personaje2 = personaje02
		duelo.jugadorGanador = jugador01
		personaje01.posicionActual = posicionIdeal
		personaje02.posicionActual = posicionIdeal
		Assert::assertEquals("Nooob",this.personaje01.estadisticas.calificacion.nombre)
		Assert::assertEquals("Nooob",this.personaje02.estadisticas.calificacion.nombre)
		this.personaje01.estadisticas.actualizarEstadisticas(duelo)
		Assert::assertEquals(1,this.personaje01.estadisticas.cantUsado)
		Assert::assertEquals(1,this.personaje01.estadisticas.cantGanado)
		duelo.actualizarPersonajesUsados
		Assert::assertEquals(1,this.personaje01.estadisticas.posiciones.size())
		Assert::assertEquals(1,this.personaje01.estadisticas.luchoCantidadDeVecesEnPosicion(posicionIdeal))
		Assert::assertEquals(1,this.jugador01.personajesUsados.size())
		Assert::assertEquals(1,this.personaje01.estadisticas.luchoCantidadDeVecesEnPosicionConTodosLosPersonajes(posicionIdeal))
		//Si habilitas este puede dar en verde como en rojo, depende del numero al azar
		//Assert::assertEquals("Manco",this.personaje01.estadisticas.calificacion.nombre)
		Assert::assertEquals("Nooob",this.personaje02.estadisticas.calificacion.nombre)
		//Si habilitas este puede dar en verde como en rojo, depende del numero al azar
		//Assert::assertEquals(true,centroDeCalificaciones.calificacionesPosibles.get(0).puedeActualizar(this.personaje01.estadisticas))
	}
}