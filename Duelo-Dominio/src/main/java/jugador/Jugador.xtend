package jugador

import denuncia.Denuncia
import java.util.List
import juego.Duelo
import juego.Estadisticas
import juego.Juego
import juego.Personaje
import juego.Resultado
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class Jugador {
	
	var Juego juego
	var String nombre
	var List<Denuncia> denuncias
	var int puntaje
	var Duelo dueloActivo
	var Estadisticas estadisticas
	
	new(String nombre, Juego juego){
		this.juego = juego
		this.nombre = nombre
		this.denuncias = newArrayList
		this.puntaje = 0
		this.dueloActivo = null
		this.estadisticas = new Estadisticas()
	}
	
	def agregarResultado(Resultado resultado){
		this.estadisticas.agregarResultado(resultado)
	}
	
	
	def int getPoderDeAtaque(Personaje personaje){
		return this.estadisticas.getCalificacion(this,personaje,juego.centroDeCalificaciones).getValor() + (this.estadisticas.getKills(personaje) + this.estadisticas.getAssists(personaje) /2 - this.estadisticas.getDeads(personaje)) * this.estadisticas.getCantUsado(personaje)
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
		if(this.estadisticas.getPersonajesUsados.isEmpty){
			var int seleccion1 = Math.round(Math.random()*(this.juego.personajes.size()-1)).intValue 
			return this.juego.personajes.get(seleccion1)
		}
		else{
			var int seleccion2 = Math.round(Math.random()*(this.estadisticas.getPersonajesUsados.size()-1)).intValue
			return this.estadisticas.getPersonajesUsados.get(seleccion2)
		}
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		for (Personaje p : this.estadisticas.getPersonajesUsados)
			cantPeleasGanadas += this.estadisticas.getCantGanado(p) + this.estadisticas.getKills(p)
		this.puntaje = this.obtenerPesoDeDenuncias() * cantPeleasGanadas
	}
	
	def obtenerPesoDeDenuncias(){
		var int peso = 0
		for (Denuncia denuncia : this.denuncias)
			peso += denuncia.motivo.getPeso()
		return peso
	}

	def denunciar(Denuncia denuncia){
		denuncia.evaluar()
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