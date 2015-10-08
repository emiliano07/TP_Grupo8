import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import calificacion.Manco
import calificacion.Nooob
import calificacion.Rampage
import juego.Personaje
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Posicion
import posicion.Top

class TestCalificacion {
	
	var CentroDeCalificaciones centroDeCalificaciones
	var Calificacion calificacion01
	var Calificacion calificacion02
	var Calificacion calificacion03
	var Posicion posicionIdeal
	var Personaje personaje01

	@Before
	def void setUp() {
		this.posicionIdeal = new Top
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,centroDeCalificaciones)
		this.calificacion01 = new Nooob
		this.calificacion02 = new Rampage
		this.calificacion03 = new Manco
	}
	
	@Test
	def agregarCalificacion() {
		this.centroDeCalificaciones.agregarCalificacion(calificacion01)
		this.centroDeCalificaciones.agregarCalificacion(calificacion02)
		Assert::assertEquals(2,this.centroDeCalificaciones.calificacionesPosibles.size())
		Assert::assertEquals(calificacion02.valor,this.centroDeCalificaciones.calificacionesPosibles.get(0).valor)
		Assert::assertEquals(calificacion01,this.centroDeCalificaciones.calificacionesPosibles.get(1))
	}
	
	@Test 
	def eliminarCalificacion() {
		this.centroDeCalificaciones.agregarCalificacion(calificacion01)
		this.centroDeCalificaciones.agregarCalificacion(calificacion02)
		this.centroDeCalificaciones.eliminarCalificacion(calificacion01)
		Assert::assertEquals(1,this.centroDeCalificaciones.calificacionesPosibles.size())
	}
	
	@Test 
	def actualizarCalificacion() {
		var top01 = new Top
		var top02 = new Top
		this.centroDeCalificaciones.agregarCalificacion(calificacion03)
		personaje01.estadisticas.posiciones.add(top01)
		personaje01.estadisticas.posiciones.add(top02)
		Assert::assertEquals("Nooob",personaje01.estadisticas.calificacion.nombre)
		personaje01.estadisticas.actualizarCalificacion()
		//Assert::assertEquals("Manco",personaje01.estadisticas.calificacion.nombre)
	}
	
	@Test 
	def puedeActualizar() {
		var top01 = new Top
		var top02 = new Top
		this.centroDeCalificaciones.agregarCalificacion(calificacion03)
		personaje01.estadisticas.posiciones.add(top01)
		personaje01.estadisticas.posiciones.add(top02)
		Assert::assertEquals(true,calificacion03.puedeActualizar(personaje01.estadisticas,50))
	}
}