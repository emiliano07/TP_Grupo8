package denuncia

import java.util.StringTokenizer
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors abstract class Denuncia {
	
	var int peso
	var String descripcion
	
	new(int peso, String descripcion){
		this.peso = peso
		this.descripcion = descripcion
	}
	
	def esValida() {
		var StringTokenizer st = new StringTokenizer(this.descripcion)
		return this.descripcion.length() <= 20 || st.countTokens < 3
	}
}