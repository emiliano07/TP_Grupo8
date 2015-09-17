import sistema.Duelo
import sistema.Juego
import sistema.Jugador
import sistema.Personaje

class Metodos {
	
	var Juego juego
	var Jugador jugador01
	var Jugador jugador02
	var Jugador jugador03
	var Personaje personaje01
	var Personaje personaje02
	var Duelo duelo
	
	/* 
	@Before
	def void setUp() {
		this.sistema = new Sistema()
		this.jugador01 = new Jugador("Jugador 01")
		this.jugador02 = new Jugador("Jugador 02")
		this.jugador03 = new Jugador("Jugador 03")
		this.personaje01 = new Personaje("Personaje 01")
		this.personaje02 = new Personaje("Personaje 02")
		this.duelo = new Duelo(jugador01)
		
	}
	
	 @Test
	def void ordenamientoDelRanking() {
		this.sistema.agregarJugador(jugador01)
		this.jugador01.setPuntaje(10)
		this.sistema.agregarJugador(jugador02)
		this.jugador02.setPuntaje(20)
		this.sistema.agregarJugador(jugador03)
		this.jugador03.setPuntaje(25)
		this.jugador01.actualizarPuntaje()
		this.sistema.actualizarRanking()
		Assert::assertEquals("Jugador 01",this.sistema.getRanking().get(0).getNombre())
		System.out.println(this.sistema.getRanking().get(0).getNombre())
		System.out.println(this.sistema.getRanking().get(1).getNombre())
		System.out.println(this.sistema.getRanking().get(2).getNombre())
		System.out.println(this.sistema.getRanking().get(0).getPuntaje())
		//System.out.println(this.personaje.actualizarPoderDeAtaque)
		
	}
	
	@Test
	def void luchar() {
		this.personaje01.setPoderDeAtaque(50)
		this.personaje02.setPoderDeAtaque(70)
		//this.duelo.seleccionarPersonajeYPosicion(personaje01,new Jungle())
		//this.duelo.seleccionarPersonajeYPosicion2(personaje02,new Jungle())
		this.duelo.luchar()
		//System.out.println(this.duelo.getGanador().getNombre())
	}*/
}
	