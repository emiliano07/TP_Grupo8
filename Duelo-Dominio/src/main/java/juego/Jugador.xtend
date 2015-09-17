package juego

import denuncia.CentralDeDenuncias
import denuncia.Denuncia
import java.util.ArrayList
import java.util.List
import java.util.Random
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
	var CentralDeDenuncias centralDeDenuncias
	
	//PREGUNTAR SI ES NECESARIO PARA ARENA
	var Denuncia tipoDeDenuncia
	var String textoDeDenuncia
	var Jugador jugadorADenunciar
	var Duelo dueloActivo

	new(String nombre, Juego juego){
		this.juego = juego
		this.nombre = nombre;
		this.personajesUsados = new ArrayList<Personaje>()
		this.denuncias = new ArrayList<Denuncia>()
		this.puntaje = 0
	}
	
	def iniciarDuelo(){
		juego.nuevoDuelo(new Duelo(this))
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
			var int seleccion2 = new Random(this.juego.getPersonajesActivados().size()).nextInt
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
/*
	def denunciar(Denuncia denuncia){
		this.centralDeDenuncias.denunciar(denuncia)
	}
*/	
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