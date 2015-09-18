import calificacion.Calificacion
import calificacion.CentroDeCalificaciones
import calificacion.Nooob
import calificacion.Rampage
import juego.Estadisticas
import juego.Personaje
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import posicion.Jungle
import posicion.Posicion

class TestCalificacion {
	
	var CentroDeCalificaciones centroDeCalificaciones
	var Calificacion calificacion01
	var Calificacion calificacion02
	var Estadisticas estadisticas
	var Posicion posicionIdeal
	var Personaje personaje01
	
	
	@Before
	def void setUp() {
		this.posicionIdeal = new Jungle
		this.personaje01 = new Personaje("Personaje 01","debilidades", "especialidades",posicionIdeal,estadisticas)
		this.estadisticas = new Estadisticas(personaje01,centroDeCalificaciones)
		this.centroDeCalificaciones = new CentroDeCalificaciones
		this.calificacion01 = new Nooob()
		this.calificacion02 = new Rampage()
	}
	
	@Test
	def agregarCalificacion() {
		this.centroDeCalificaciones.agregarCalificacion(calificacion01)
		this.centroDeCalificaciones.agregarCalificacion(calificacion02)
		Assert::assertEquals(2,this.centroDeCalificaciones.calificacion.size())
		Assert::assertEquals(calificacion02.valor,this.centroDeCalificaciones.calificacion.get(0).valor)
		Assert::assertEquals(calificacion01,this.centroDeCalificaciones.calificacion.get(1))
	}
	
	@Test 
	def eliminarCalificacion() {
		this.centroDeCalificaciones.agregarCalificacion(calificacion01)
		this.centroDeCalificaciones.agregarCalificacion(calificacion02)
		this.centroDeCalificaciones.eliminarCalificacion(calificacion01)
		Assert::assertEquals(1,this.centroDeCalificaciones.calificacion.size())
	}
	
	
	/* @Test 
	def actualizarCalificacion() {
		this.centroDeCalificaciones.actualizarCalificacion(calificacion01,estadisticas)
		
	}*/
}