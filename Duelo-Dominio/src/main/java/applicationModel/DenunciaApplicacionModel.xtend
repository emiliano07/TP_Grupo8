package applicationModel

import denuncia.Abuso_de_habilidad
import denuncia.ComunicacionAbusiva
import denuncia.Denuncia
import denuncia.FeedIntencional
import juego.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class DenunciaApplicacionModel {
	
	var Jugador jugadorDenunciado 
	var Denuncia denuncia
	
	
	new(Jugador denunciado, Denuncia denuncia) {
		this.jugadorDenunciado = denunciado
		this.denuncia = denuncia
	}
	
	def denunciar() {
		jugadorDenunciado = this.denuncia.analizarDenuncia()
	}
	
	def sancionReportadaHaciaOtro() {
		denuncia.denunciante != jugadorDenunciado
	}
	
	def getDenunciasPosibles(){
		#[new Abuso_de_habilidad, new ComunicacionAbusiva, new FeedIntencional]
	}
	
	
}