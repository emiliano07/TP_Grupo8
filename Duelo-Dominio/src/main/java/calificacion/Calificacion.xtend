package calificacion

import juego.Personaje
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors abstract class Calificacion {
	
	var int valor
	
	new(int valor){
		this.valor = valor
	}
	
	def abstract Calificacion actualizar(Personaje personaje)
	
}