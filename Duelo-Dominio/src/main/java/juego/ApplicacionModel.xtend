package juego

import denuncia.Abuso_de_habilidad
import denuncia.CentralDeDenuncias
import denuncia.ComunicacionAbusiva
import denuncia.Denuncia
import denuncia.FeedIntencional
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class ApplicacionModel {
	
	var Jugador jugadorDenunciado 
	var Denuncia denuncia
	var CentralDeDenuncias centralDeDenuncias
	
	
	new(Jugador denunciado, Denuncia denuncia) {
		this.jugadorDenunciado = denunciado
		this.centralDeDenuncias = new CentralDeDenuncias
		this.denuncia = denuncia
	}
	
	def denunciar() {
		jugadorDenunciado = this.centralDeDenuncias.denunciar(denuncia)
	}
	
	def getDenunciasPosibles(){
		#[new Abuso_de_habilidad, new ComunicacionAbusiva, new FeedIntencional]
	}
	
	def sancionReportadaHaciaOtro() {
		denuncia.denunciante != jugadorDenunciado
	}
	
	
}