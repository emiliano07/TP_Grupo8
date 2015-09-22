package calificacion

import juego.Estadisticas
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors abstract class Calificacion {
	
	var String nombre
	var int valor
	
	new(String nombre, int valor){
		this.nombre = nombre
		this.valor = valor
	}
	
	def abstract Boolean puedeActualizar(Estadisticas estadisticas)
}