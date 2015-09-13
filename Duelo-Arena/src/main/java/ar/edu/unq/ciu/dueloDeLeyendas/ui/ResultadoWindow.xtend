package ar.edu.unq.ciu.dueloDeLeyendas.ui

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import sistema.Jugador

class ResultadoWindow extends SimpleWindow<Jugador>{
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador)
		
		title = ""
		taskDescription = "" //Quiero sacarlo
	}
	
	override protected createFormPanel(Panel mainPanel) {

	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
}