import org.junit.Before
import org.junit.Test
import sistema.Duelo
import sistema.Jugador
import sistema.Personaje
import sistema.Sistema

class JugadorTest {
	var Sistema sistema
	var Jugador jugador01
	var Jugador jugador02
	var Jugador jugador03
	var Personaje personaje01
	var Personaje personaje02
	var Duelo duelo
	
	
	@Before
	def void setUp() {
		this.sistema = new Sistema()
		this.jugador01 = new Jugador(/*"Jugador 01"*/)
		this.jugador02 = new Jugador(/*"Jugador 02"*/)
		this.jugador03 = new Jugador(/*"Jugador 03"*/)
		this.personaje01 = new Personaje("Personaje 01")
		this.personaje02 = new Personaje("Personaje 02")
		this.duelo = new Duelo(jugador01)
		
	}
	
	@Test
	def actualizarPuntaje() {
		
	}
}