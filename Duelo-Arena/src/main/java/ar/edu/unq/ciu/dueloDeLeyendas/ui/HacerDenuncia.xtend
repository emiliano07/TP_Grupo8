package ar.edu.unq.ciu.dueloDeLeyendas.ui

import denuncia.Denuncia
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow

class HacerDenuncia extends MainWindow<Denuncia>{
	
	new() {
		super(new Denuncia)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Hacer denuncia"
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = "Estas queriendo denunciar a: " + "PERSONJAJE - VER COMO SE HACE???"
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label (secondPanel) => [
			text = "Motivo:"
		]
		
		//agregar el listado de denuncias
		
		new Label (secondPanel) => [
			text = "Detalles:"
		]
		
		new TextBox(secondPanel) //.bindValueToProperty("aca va la descripcion de la denuncia")
		
		new Button(secondPanel) => [
			caption = "Denunciar"
			onClick = "VER QUE HACEMOS"
			setAsDefault
			disableOnError
		]
		
		new Button(secondPanel) => [
			caption = "Cancelar"
			onClick = "VER QUE HACEMOS"
			setAsDefault
			disableOnError
		]
	}
}