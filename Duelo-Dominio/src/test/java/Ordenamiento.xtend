import org.junit.Before
import org.junit.Test
import sistema.Jugador
import sistema.Sistema

class Ordenamiento {
	
	var Sistema sistema
	var Jugador jugador01
	var Jugador jugador02
	var Jugador jugador03
	
	
	@Before
	def setUp() {
		this.sistema = new Sistema()
		this.jugador01 = new Jugador("Jugador 01")
		this.jugador01.setPuntaje(10)
		this.jugador02 = new Jugador("Jugador 02")
		this.jugador02.setPuntaje(30)
		this.jugador03 = new Jugador("Jugador 03")
		this.jugador03.setPuntaje(20)
	}
	
	@Test
	def void ordenamientoDelRanking() {
		this.sistema.getRanking().add(jugador01)
		this.sistema.getRanking().add(jugador02)
		this.sistema.agregarJugador(jugador03)
		System.out.println(this.sistema.getRanking())
		System.out.println(this.sistema.getRanking().get(1).nombre)
		
	}
	
}