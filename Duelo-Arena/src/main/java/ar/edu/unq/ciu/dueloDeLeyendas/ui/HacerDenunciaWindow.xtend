package ar.edu.unq.ciu.dueloDeLeyendas.ui

import denuncia.Denuncia
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import sistema.Jugador

class HacerDenunciaWindow extends SimpleWindow<Jugador>{
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador)
		
		title = "Hacer denuncia"
		taskDescription = "" //Quiero sacarlo
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new ColumnLayout(1)
		
		new Label(mainPanel).text = "Estas queriendo denunciar a: " //+ modelObject.getJugadorADenunciar().getNombre()
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label (secondPanel).setText("Motivo:")
		
		new Selector(secondPanel) => [
			allowNull = false
			width = 250
			bindItemsToProperty("denunciasPosibles") //queremos que aparezca el listado de denuncias posibles
			bindValueToProperty("tipoDeDenuncia")
		]
		
		new Label (secondPanel).setText("Detalles:")
		
		new TextBox(secondPanel) => [
			width = 400
            height = 150
			bindValueToProperty("textoDeDenuncia")
		]
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Denunciar"
			setAsDefault
			onClick = [ | this.denunciar() ]
			disableOnError
		]
		
		new Button(actionPanel) => [
			caption = "Cancelar"
			onClick = [| this.close()]
			setAsDefault
			disableOnError
		]
	}
	
	def void denunciar(){
		var Denuncia denuncia
		denuncia =	modelObject.getTipoDeDenuncia()
		denuncia.setDescripcion(modelObject.getTextoDeDenuncia())
		modelObject.denunciar(modelObject.getJugadorADenunciar(), denuncia)
		if(denuncia.esValida())
			this.openWindow(new HemosSancionadoWindow(this, modelObject))
		else
			this.openWindow(new HasSidoSancionadoWindow(this, modelObject))
	}
	
	def openWindow(Window<?> window) {
		window.open
	}
	
}