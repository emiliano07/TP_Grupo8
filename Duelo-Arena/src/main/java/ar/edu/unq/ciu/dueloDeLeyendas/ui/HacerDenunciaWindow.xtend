package ar.edu.unq.ciu.dueloDeLeyendas.ui

import denuncia.Denuncia
import juego.ApplicacionModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class HacerDenunciaWindow extends SimpleWindow<ApplicacionModel>{
	
	new(WindowOwner owner, ApplicacionModel model) {
		super(owner, model)
		
		title = "Hacer denuncia"
		taskDescription = "Ingrese el motivo por el que realiza la denuncia" 
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		var firstPanel = new Panel(mainPanel)
		firstPanel.setLayout(new ColumnLayout(2))
		
		new Label(firstPanel).setText("Estas queriendo denunciar a:") 
		
		new Label(firstPanel).bindValueToProperty("denuncia.denunciado.nombre")
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label (secondPanel).setText("Motivo:")
		
		new Selector(secondPanel) => [
			allowNull = false
			width = 250
			bindItemsToProperty("denunciasPosibles").adapter = new PropertyAdapter(Denuncia,"descripcion") 
			bindValueToProperty("denuncia")
		]
		
		new Label (secondPanel).setText("Detalles:")
		
		new TextBox(secondPanel) => [
			width = 400
            height = 150
			//bindValueToProperty("denuncia.denunciante.textoDeDenuncia")
		]
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Denunciar"
			setAsDefault
			onClick = [ |mostrarResultado()]
			disableOnError
		]
		
		new Button(actionPanel) => [
			caption = "Cancelar"
			onClick = [| this.close()]
			setAsDefault
			disableOnError
		]
	}
	
	def mostrarResultado() {
		modelObject.denunciar()
		if(modelObject.sancionReportadaHaciaOtro())
			new HemosSancionadoWindow(this,modelObject.jugadorDenunciado).open()
		else
			new HasSidoSancionadoWindow(this,modelObject.jugadorDenunciado).open()
		}
}