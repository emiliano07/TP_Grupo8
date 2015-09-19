package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DenunciaApplicacionModel
import applicationModel.DueloApplicationModel
import denuncia.FeedIntencional
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
		title = duelo.retador + " vs " + duelo.retado 
		taskDescription = "En la siguiente planilla se mostrara el resultado del Duelo"

	}
	
	override protected createFormPanel(Panel mainPanel) {
		var firstPanel = new Panel(mainPanel)
		firstPanel.setLayout(new ColumnLayout(2))
		new Label(firstPanel).setText("Perdiste contra") 
		new Label(firstPanel) => [ text = "Perdedor"]
		//new Label(firstPanel).bindValueToProperty("")
		new Label(firstPanel) => [ text = modelObject.duelo.jugador1.nombre fontSize = 15  foreground = Color.WHITE background = Color.BLUE]
		new Label(firstPanel) => [ text = modelObject.duelo.jugador2.nombre fontSize = 15  foreground = Color.WHITE background = Color.BLUE]
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		estadisticasRetador(secondPanel)
		estadisticasRetado(secondPanel)
	}
	
	 
	def estadisticasRetador(Panel panel) {
		crearParteTemp(panel , "estadisticasRetador")
	}	
	
	def estadisticasRetado(Panel panel) {
		crearParteTemp(panel , "estadisticasRetado")
	}
	
	def crearParteTemp(Panel panel , String estadisticaCorrespondiente) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)		
			crearLabel(it,"Jugadas",estadisticaCorrespondiente +".cantUsado")
			crearLabel(it,"Ganadas",estadisticaCorrespondiente +".cantGanado")
			crearLabel(it,"Kills",estadisticaCorrespondiente + ".kills")
			crearLabel(it,"Deads",estadisticaCorrespondiente + ".deads")
			crearLabel(it,"Assists",estadisticaCorrespondiente + ".assists")
			crearLabel(it,"Mejor ubicacion",estadisticaCorrespondiente + ".mejorUbicacion")
			crearLabel(it,"Puntaje",estadisticaCorrespondiente + ".calificacion.valor")
		]		
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel) => [
	            bindValueToProperty(property)
	    ]
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
		var feed = new FeedIntencional // para probar si abre la ventana
		//en este caso el denunciado es el jugador02 osea el que no inicio el duelo
		new HacerDenunciaWindow(this,new DenunciaApplicacionModel(modelObject.duelo.jugador2,feed)).open()
	}
}