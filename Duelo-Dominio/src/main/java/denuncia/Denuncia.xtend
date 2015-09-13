package denuncia

import java.util.StringTokenizer
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors abstract class Denuncia {
	override toString(){
		this.class.simpleName
		//var String nombre = this.class.simpleName
		//var String[] nombreFinal = nombre.split("_")
		//return nombreFinal.toString
	}
	
	var int peso
	var String descripcion
	
	new(int peso){
		this.peso = peso
		this.descripcion = ""
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
}