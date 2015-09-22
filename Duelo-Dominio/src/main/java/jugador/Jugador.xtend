package jugador

import denuncia.Denuncia
import java.util.List
import juego.Duelo
import juego.Juego
import juego.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Jugador {
	
	var Juego juego
	var String nombre
	var List<Personaje> personajesParaUsar
	var List<Personaje> personajesUsados
	var List<Denuncia> denuncias
	var int puntaje
	var Duelo dueloActivo
	
	new(String nombre, Juego juego){
		this.juego = juego
		this.nombre = nombre
		this.personajesParaUsar = newArrayList
		this.personajesUsados = newArrayList
		this.denuncias = newArrayList
		this.puntaje = 0
		this.dueloActivo = null
	}
	
	def cargarPersonajesParaUsar(){
		for(Personaje per : this.juego.personajes){
			var Personaje p = new Personaje(per.nombre,per.debilidades,per.especialidades,per.posicionIdeal,juego.centroDeCalificaciones)
			p.jugadorAlQuePertenece = this
			this.personajesParaUsar.add(p)
		}
	}
	
	def iniciarDuelo(){
		var Duelo duelo = new Duelo(this,juego)
		juego.nuevoDuelo(duelo)
		this.dueloActivo = duelo
	}
	
	def seleccionarPersonaje(Duelo duelo, Personaje personaje){
		duelo.seleccionarPersonaje(personaje)
	}
	
	def seleccionarPosicion(Duelo duelo, Posicion posicion){
		duelo.seleccionarPosicion(posicion)
	}
	
	def getPersonajeAlazar() {
		if(this.personajesUsados.isEmpty){
			var int seleccion1 = Math.round(Math.random()*(this.personajesParaUsar.size()-1)).intValue 
			return this.personajesParaUsar.get(seleccion1)
		}
		else{
			var int seleccion2 = Math.round(Math.random()*(this.personajesUsados.size()-1)).intValue
			return this.personajesUsados.get(seleccion2)
		}
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		for (Personaje p : this.personajesUsados)
			cantPeleasGanadas += p.getEstadisticas().getCantGanado() + p.getEstadisticas().getKills()
		this.puntaje = this.obtenerPesoDeDenuncias() * cantPeleasGanadas
	}
	
	def void actualizarPersonajesUsados(Personaje personaje){
		if(!this.personajesUsados.contains(personaje))
			this.personajesUsados.add(personaje)
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