package denuncia

import java.util.StringTokenizer
import juego.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Denuncia {
	
	var int peso
	var String descripcion
	var Jugador denunciante
	var Jugador denunciado
	
	new(int peso){
		this.peso = peso
		this.denunciante = null
		this.denunciado = null
		this.descripcion = " "
	}
	
	def Jugador analizarDenuncia() {
		var Jugador denunciado = null
		if(this.esValida()){
			denunciado = denunciado
			denunciado.agregarNuevaDenuncia(this)
		}
		else{
			denunciado = denunciante
			var Denuncia denunciaNueva = new AbusoDelSistemaDeDenuncias()
			this.setDescripcion("El jugador intenta denunciar a: " + denunciante.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificacion suficiente: " + descripcion)
			denunciante.agregarNuevaDenuncia(denunciaNueva)	
		}
		denunciado
	}
	
	def esValida() {
		return this.noSuperaLosVeinteCaracteres() || this.tieneMasDeTresPalabras()
	}
	
	def Boolean tieneMasDeTresPalabras(){
		var StringTokenizer st = new StringTokenizer(this.descripcion)
		return st.countTokens > 3
	}
	
	def Boolean noSuperaLosVeinteCaracteres(){
		return this.descripcion.length() <= 20
	}
	
	def abstract String getDescripcion()
}