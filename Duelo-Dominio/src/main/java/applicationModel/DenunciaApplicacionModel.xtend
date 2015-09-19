package applicationModel

import denuncia.Abuso_de_habilidad
import denuncia.ComunicacionAbusiva
import denuncia.Denuncia
import denuncia.FeedIntencional
import juego.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class DenunciaApplicacionModel {
	
	var Jugador jugadorDenunciante
	var Jugador jugadorDenunciado
	var Jugador jugadorSancionado
	var Denuncia denuncia
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado) {
		this.jugadorDenunciante = jugadorDenunciante
		this.jugadorDenunciado =jugadorDenunciado
		this.denuncia = null
		this.jugadorSancionado = null
	}
	
	def denunciar() {
		this.jugadorSancionado = this.denuncia.analizarDenuncia()
	}
	
	def sancionADenunciado() {
		this.jugadorSancionado == this.jugadorDenunciado
	}
	
	def getDenunciasPosibles(){
		#[new Abuso_de_habilidad(this.jugadorDenunciante,this.jugadorDenunciado), new ComunicacionAbusiva(this.jugadorDenunciante,this.jugadorDenunciado), new FeedIntencional(this.jugadorDenunciante,this.jugadorDenunciado)]
	}
	
	def setDenuncia(Denuncia denuncia){
		this.denuncia = denuncia
		this.jugadorDenunciado = denuncia.getDenunciado()
		ObservableUtils.firePropertyChanged(this,this.jugadorDenunciado.getNombre(),this.getJugadorDenunciado())
	}
	
//	def isPuedeDenunciar(){
//		denuncia != null
//	}
}