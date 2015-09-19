package posicion

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Posicion {
	
	var String nombre
	
	new(String nombre){
		this.nombre = nombre
	}
}