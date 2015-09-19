package juego

import denuncia.Denuncia
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Jugador {
	
	var Juego juego
	var String nombre
	var List<Personaje> personajesUsados
	var List<Denuncia> denuncias
	var int puntaje
	var Duelo dueloActivo

	new(String nombre, Juego juego){
		this.juego = juego
		this.nombre = nombre;
		this.personajesUsados = newArrayList
		this.denuncias = newArrayList
		this.puntaje = 0
	}
	
	def iniciarDuelo(){
		juego.nuevoDuelo(new Duelo(this,juego))
	}
	
	def seleccionarPersonaje(Duelo duelo, Personaje personaje){
		duelo.seleccionarPersonaje(personaje)
	}
	
	def seleccionarPosicion(Duelo duelo, Posicion posicion){
		duelo.seleccionarPosicion(posicion)
	}
	
	def getPersonajeAlazar() {
		var int seleccion1 = Math.round(Math.random()*(this.personajesUsados.size()-1)).intValue 
		if(this.personajesUsados.isEmpty){
			var int seleccion2 = Math.round(Math.random()*(this.juego.getPersonajesActivados().size()-1)).intValue 
			return juego.getPersonajesActivados().get(seleccion2)
		}
		return this.personajesUsados.get(seleccion1)
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		for (Personaje p : this.personajesUsados)
			cantPeleasGanadas += p.getEstadisticas().getCantGanado() + p.getEstadisticas().getKills()
		this.puntaje = this.obtenerPesoDeDenuncias() * cantPeleasGanadas
	}
	
	def obtenerPesoDeDenuncias(){
		var int peso = 0
		for (Denuncia denuncia : this.denuncias)
			peso += denuncia.getPeso()
		return peso
	}

	def denunciar(Denuncia denuncia){
		denuncia.analizarDenuncia()
	}
	
	def agregarNuevaDenuncia(Denuncia denuncia) {
		this.denuncias.add(denuncia)
		this.actualizarPuntaje()
	}
	
	def descansarEnMiGloria(Duelo duelo){
		duelo.cancelarDuelo()
		}
	
	def retarAMRX(Duelo duelo){
		duelo.retarAMRX()
	}
}