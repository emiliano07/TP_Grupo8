package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DenunciaApplicacionModel
import applicationModel.DueloApplicationModel
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class ResultadoWindow extends SimpleWindow<DueloApplicationModel>{
	
	new(WindowOwner parent, DueloApplicationModel duelo) {
		super(parent, duelo)
		title =   "Duelo De Leyendas"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = modelObject.personajeRetador + " vs " + modelObject.personajeRetado
			foreground = Color.WHITE
			background = Color.BLACK
			fontSize = 25
		]
		
		new Label(mainPanel) => [
			modelObject.resultadoRetador()
			text = modelObject.resultado
			foreground = Color.GREEN
			background = Color.YELLOW
			fontSize = 15
		]	
			
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label(secondPanel) => [ 
			text = modelObject.retador
			fontSize = 15
			foreground = Color.WHITE
			background = Color.BLUE
		]
		
		new Label(secondPanel) => [ 
			text = modelObject.retado
			fontSize = 15
			foreground = Color.WHITE
			background = Color.BLUE
		]
		
		new Label(secondPanel) => [ 
			text = "Stats - " + modelObject.personajeRetador
			fontSize = 15
			foreground = Color.BLUE
			background = Color.WHITE
		]
		
		new Label(secondPanel) => [ 
			text = "Stats - " + modelObject.personajeRetado
			fontSize = 15
			foreground = Color.BLUE
			background = Color.WHITE
		]
		
		crearPanelDeEstadisticasRetador(secondPanel)
		crearPanelDeEstadisticasRetado(secondPanel)
		
		new Label(mainPanel) => [ 
			text = "Ganador: " + modelObject.ganador + "!! - " + modelObject.puntosRetador + " puntos contra " + modelObject.puntosRetado + " puntos"
			fontSize = 15
			foreground = Color.BLACK
			background = Color.YELLOW
		]
	}
	
	 
	def crearPanelDeEstadisticasRetador(Panel panel) {
		estadisticPanel(panel, "estadisticasRetador")
	}	
	
	def crearPanelDeEstadisticasRetado(Panel panel) {
		estadisticPanel(panel, "estadisticasRetado")
	}
	
	def estadisticPanel(Panel panel , String estadisticaCorrespondiente) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)		
			crearLabel(it,"Jugadas",estadisticaCorrespondiente +".cantUsado")
			crearLabel(it,"Ganadas",estadisticaCorrespondiente +".cantGanado")
			crearLabel(it,"Kills",estadisticaCorrespondiente + ".kills")
			crearLabel(it,"Deads",estadisticaCorrespondiente + ".deads")
			crearLabel(it,"Assists",estadisticaCorrespondiente + ".assists")
			crearLabel(it,"Mejor ubicacion",estadisticaCorrespondiente + ".mejorUbicacion.nombre")
			crearLabel(it,"Puntaje",estadisticaCorrespondiente + ".calificacion.nombre")
		]		
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel).bindValueToProperty(property)
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar derrota con honor"
			setAsDefault
			onClick [ | this.close() ]
			disableOnError
		]
		
		new Button(actionPanel) => [
			caption = " Denunciar Actitud Antideportiva"
			setAsDefault
			onClick [ |denunciar() ]
			disableOnError
		]
	}

	def denunciar(){
		new HacerDenunciaWindow(this,new DenunciaApplicacionModel(modelObject.duelo.getJugador1, modelObject.duelo.getJugador2)).open()
	}
}