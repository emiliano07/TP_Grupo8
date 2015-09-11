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
	
	new(String nombre){
		this.nombre = nombre;
		this.personajesUsados = new ArrayList<Personaje>()
		this.denuncias = new ArrayList<Denuncia>()
		this.puntaje = 0
	}
	
	def getPersonajeAlazar() {
		var int seleccion = new Random(this.personajesUsados.size()).nextInt 
		return this.personajesUsados.get(seleccion)
	}
	
	def actualizarPuntaje(){
		var int cantPeleasGanadas = 0
		for (Personaje p : this.personajesUsados)
			cantPeleasGanadas += p.getEstadisticas().getCantGanado() + p.getEstadisticas().getKills()
		this.puntaje += this.obtenerPesoDeDenuncias() * cantPeleasGanadas
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