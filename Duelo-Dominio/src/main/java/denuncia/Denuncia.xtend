package denuncia

import java.util.StringTokenizer
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Denuncia {
	
	var int peso
	var String descripcion
	var Jugador denunciante
	var Jugador denunciado
	
	new(int peso, Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		this.peso = peso
		this.denunciante = jugadorDenunciante
		this.denunciado = jugadorDenunciado
		this.descripcion = ""
	}
	
	def Jugador analizarDenuncia() {
		var Jugador jugadorDenunciado = null
		if(this.esValida()){
			jugadorDenunciado = denunciado
			jugadorDenunciado.agregarNuevaDenuncia(this)
		}
		else{
			jugadorDenunciado = denunciante
			var Denuncia denunciaNueva = new AbusoDelSistemaDeDenuncias(this.denunciante, this.denunciante)
			denunciaNueva.setDescripcion("El jugador intenta denunciar a: " + this.denunciado.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificacion suficiente: " + descripcion)
			denunciante.agregarNuevaDenuncia(denunciaNueva)	
		}
		jugadorDenunciado
	}
	
	def esValida() {
		return this.superaLosVeinteCaracteres() || this.tieneMasDeTresPalabras()
	}
	
	def Boolean tieneMasDeTresPalabras(){
		var StringTokenizer st = new StringTokenizer(this.descripcion)
		return st.countTokens >= 3
	}
	
	def Boolean superaLosVeinteCaracteres(){
		return this.descripcion.length() >= 20
	}
	
	def abstract String getNombre()
}