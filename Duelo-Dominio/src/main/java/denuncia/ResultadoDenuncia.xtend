package denuncia

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ResultadoDenuncia {
	private String descripcionDelHecho
	private String explicacionMotivo
	
	def static ResultadoDenuncia denunciaExitosa(Denuncia denuncia) {
		var ResultadoDenuncia instance = new ResultadoDenuncia
		instance.descripcionDelHecho = " Hemos sancionado a " + denuncia.denunciado.nombre
		instance.explicacionMotivo = ''' 
			En duelo de leyendas somos partidarios del fair play.
			Gracias por ayudarnos a mantenernos así!!!
			'''
		instance
	}
	
	def static ResultadoDenuncia denunciaEnContra() {
		var ResultadoDenuncia instance = new ResultadoDenuncia
		instance.descripcionDelHecho = "Has sido sancionado!"
		instance.explicacionMotivo = ''' 
			Hemos detectado que tu denuncia no tiene fundamentos sólidos.
			En duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play.
			Con lo que has recibido una sanción por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud
			'''
		instance
	}
}