package applicationModel

import denuncia.Denuncia
import denuncia.Motivo
import denuncia.ResultadoDenuncia
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class DenunciaApplicacionModel {

	var Denuncia denuncia
	
	new(Denuncia denuncia) {
		this.denuncia = denuncia
	}
	
	def ResultadoDenuncia denunciar() {
		this.denuncia.evaluar()
	}
	
	def List<Motivo> getDenunciasPosibles(){
		this.denuncia.getMotivosPosibles()
	}
}