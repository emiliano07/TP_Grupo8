package sistema

import denuncia.CentralDeDenuncias
import denuncia.Denuncia
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors class Jugador {
	
	var String nombre
	var ArrayList<Personaje> personajesUsados
	var ArrayList<Denuncia> denuncias
	var int puntaje
	var CentralDeDenuncias centralDeDenuncias
	
	new(){
		this.personajesUsados = new ArrayList<Personaje>()
		this.denuncias = new ArrayList<Denuncia>()
		this.puntaje = 0
	}
	
	def getPersonajeAlazar() {
		var int seleccion = new Random(100).nextInt //escalon.size()
		return this.personajesUsados.get(seleccion)
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		var int totalDeCalificaciones = 0 
		for (Personaje p : this.personajesUsados){
			totalDeCalificaciones += p.getEstadisticas().getCalificacion().getValor()
			cantPeleasGanadas += p.getEstadisticas().getCantGanado() + p.getEstadisticas().getKills()
		}
		this.puntaje = ((totalDeCalificaciones/this.personajesUsados.size()) - this.obtenerPesoDeDenuncias()) * cantPeleasGanadas
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
	
}