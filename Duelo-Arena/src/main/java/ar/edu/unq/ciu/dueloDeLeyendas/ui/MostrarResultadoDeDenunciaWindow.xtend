package ar.edu.unq.ciu.dueloDeLeyendas.ui

import denuncia.ResultadoDenuncia
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class MostrarResultadoDeDenunciaWindow extends SimpleWindow<ResultadoDenuncia>{
	
	new(WindowOwner owner, ResultadoDenuncia resultado) {
		super(owner, resultado)
		title = "Duelo de Leyendas"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Titulo(mainPanel, modelObject.descripcionDelHecho)
		
		new Label(mainPanel) => [
			text = modelObject.explicacionMotivo
		]
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | this.close() ]
		]
	}
}