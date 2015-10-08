package denuncia

import java.util.List
import java.util.StringTokenizer
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Denuncia {
	
	var Motivo motivo
	var String descripcion
	var Jugador denunciante
	var Jugador denunciado
	
	new(Jugador jugadorDenunciante, Jugador jugadorDenunciado){
		this.motivo = null
		this.denunciante = jugadorDenunciante
		this.denunciado = jugadorDenunciado
		this.descripcion = ""
	}
	
	def ResultadoDenuncia evaluar() {
		var Jugador jugadorDenunciado = null
		if(this.esValida()){
			jugadorDenunciado = denunciado
			jugadorDenunciado.agregarNuevaDenuncia(this)
			ResultadoDenuncia.denunciaExitosa(this)
		}
		else{
			jugadorDenunciado = denunciante
			var Denuncia denunciaNueva = new Denuncia(this.denunciante,this.denunciado)
			denunciaNueva.setMotivo(Motivo.AbusoDelSistemaDeDenuncias)
			denunciaNueva.setDescripcion("El jugador intenta denunciar a: " + this.denunciado.getNombre() + ". Por abuso del Sistema de Denuncias, sin tener una justificacion suficiente: " + descripcion)
			denunciante.agregarNuevaDenuncia(denunciaNueva)
			ResultadoDenuncia.denunciaEnContra()
		}
	}
	
	def esValida() {
		return this.superaLosVeinteCaracteres() || this.tieneMasDeTresPalabras()
	}
	
	def Boolean tieneMasDeTresPalabras(){
		var StringTokenizer st = new StringTokenizer(this.descripcion)
		return st.countTokens >= 3
	}
	
	def Boolean superaLosVeinteCaracteres(){
		return this.descripcion.length() >= 20
	}
	
	def List<Motivo> getMotivosPosibles(){
		var List<Motivo> motivos = newArrayList
		motivos.add(Motivo.AbusoDeHabilidad)
		motivos.add(Motivo.ComunicacionAbusiva)
		motivos.add(Motivo.FeedIntencional)
		return motivos
	}
}