package posicion

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors abstract class Posicion {
	
	var String nombre
	
	new(String nombre){
		this.nombre = nombre
	}
}