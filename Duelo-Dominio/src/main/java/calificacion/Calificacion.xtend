package calificacion

import org.eclipse.xtend.lib.annotations.Accessors
import sistema.Estadisticas

@Accessors abstract class Calificacion {
	
	var int valor 
	
	def abstract Calificacion actualizar(Estadisticas estadisticas)
	
}