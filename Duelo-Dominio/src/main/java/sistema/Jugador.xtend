package sistema

import denuncia.CentralDeDenuncias
import denuncia.Denuncia
import java.util.ArrayList
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import posicion.Posicion

@Accessors class Jugador {
	
	var Sistema sistema
	var String nombre
	var ArrayList<Personaje> personajesUsados
	var ArrayList<Denuncia> denuncias
	var int puntaje
	var CentralDeDenuncias centralDeDenuncias
	
	new(String nombre, Sistema sistema){
		this.sistema = sistema
		this.nombre = nombre;
		this.personajesUsados = new ArrayList<Personaje>()
		this.denuncias = new ArrayList<Denuncia>()
		this.puntaje = 0
	}
	
	def iniciarDuelo(){
		sistema.nuevoDuelo(new Duelo(this))
	}
	
	def seleccionarPersonaje(Duelo duelo, Personaje personaje){
		duelo.seleccionarPersonaje(personaje)
	}
	
	def seleccionarPosicion(Duelo duelo, Posicion posicion){
		duelo.seleccionarPosicion(posicion)
	}
	
	def getPersonajeAlazar() {
		var int seleccion1 = new Random(this.personajesUsados.size()).nextInt 
		if(this.personajesUsados.isEmpty){
			var int seleccion2 = new Random(this.sistema.getPersonajesActivados().size()).nextInt
			return sistema.getPersonajesActivados().get(seleccion2)
		}
		return this.personajesUsados.get(seleccion1)
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		for (Personaje p : this.personajesUsados)
			cantPeleasGanadas += p.getEstadisticas().getCantGanado() + p.getEstadisticas().getKills()
		this.puntaje == this.obtenerPesoDeDenuncias() * cantPeleasGanadas
	}
	
	def obtenerPesoDeDenuncias(){
		var int peso = 0
		for (Denuncia denuncia : this.denuncias)
			peso += denuncia.getPeso()
		return peso
	}

	def denunciar(Jugador jugador, Denuncia denuncia){
		this.centralDeDenuncias.analizarDenuncia(this, jugador, denuncia)
	}
	
	def agregarNuevaDenuncia(Denuncia denuncia) {
		this.denuncias.add(denuncia)
	}
	
	def descansarEnMiGloria(Duelo duelo){
		duelo.cancelarDuelo()
		}
	
	def retarAMRX(Duelo duelo){
		duelo.retarAMRX()
	}
}