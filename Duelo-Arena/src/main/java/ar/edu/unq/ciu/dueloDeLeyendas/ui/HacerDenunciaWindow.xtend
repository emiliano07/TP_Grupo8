package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DenunciaApplicacionModel
import denuncia.Motivo
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class HacerDenunciaWindow extends SimpleWindow<DenunciaApplicacionModel>{
	
	new(WindowOwner owner, DenunciaApplicacionModel model) {
		super(owner, model)
		
		title = "Duelo De Leyendas"
		taskDescription = "Ingrese el motivo por el que realiza la denuncia" 
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Titulo(mainPanel, "Hacer denuncia")
				
		new Label(mainPanel) => [
			text = "Estas queriendo denunciar a: " + modelObject.denuncia.denunciado.nombre
			foreground = Color.GREEN
			] 
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label (secondPanel).setText("Motivo:")
		new Selector(secondPanel) => [
			allowNull = false
			width = 250
			bindItemsToProperty("denunciasPosibles").adapter = new PropertyAdapter(Motivo,"nombre") 
			bindValueToProperty("denuncia.motivo")
		]
		
		new Label (secondPanel).setText("Detalles:")
		new TextBox(secondPanel) => [
			width = 400
            height = 150
			bindValueToProperty("denuncia.descripcion")
		]
	}
	
	override protected addActions(Panel actionPanel) {
		val elementSelected = new NotNullObservable("denuncia")
		new Button(actionPanel) => [
			caption = "Denunciar"
			onClick = [ |new MostrarResultadoDeDenunciaWindow(this,modelObject.denunciar()).open]
			bindEnabled(elementSelected)
		]
		
		new Button(actionPanel) => [
			caption = "Cancelar"
			setAsDefault
			onClick [ | this.close() ]
			disableOnError
		]
	}
}