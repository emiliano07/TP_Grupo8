package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DueloApplicationModel
import java.awt.Color
import juego.Jugador
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NoTienesRivalWindow extends SimpleWindow<Jugador> {
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador)

		title = "Duelo de Leyendas"
		taskDescription =  "" 
	}
		
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = "No tienes rival!!!"
			foreground = Color.WHITE
			background = Color.BLACK
			fontSize = 25
			] 
		
		new Label(mainPanel).text = 
'''
NO HAY QUIEN SE TE ANIME EN TU RANKING ACTUAL.
Puedes optar por retar al bot del nivel y tratar de avanzar de nivel en el ranking o disfrutar de tu gloria y descansar ¿Qué queres hacer?
'''
}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Retar a MR-X!!!"
			setAsDefault
			onClick = [ | this.retarAMRX() ]
		]
		
		new Button(actionPanel) => [
			caption = "Descansar en mi gloria"
			setAsDefault
			onClick = [ | this.descansarEnMiGloria() ]
		]
	}
	
	def descansarEnMiGloria() {
		modelObject.descansarEnMiGloria(modelObject.getDueloActivo())
		this.close
	}
	
	def retarAMRX() {
		modelObject.retarAMRX(modelObject.getDueloActivo())
		new ResultadoWindow(this, new DueloApplicationModel(modelObject.dueloActivo)).open()
	}
		
}