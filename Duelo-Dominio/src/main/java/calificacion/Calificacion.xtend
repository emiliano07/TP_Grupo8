package calificacion

import juego.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Calificacion {
	
	var int valor
	
	new(int valor){
		this.valor = valor
	}
	
	def abstract Calificacion actualizar(Personaje personaje)
	
}