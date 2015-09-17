package ar.edu.unq.ciu.dueloDeLeyendas.ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import sistema.Jugador

class HemosSancionadoWindow  extends SimpleWindow<Jugador> {
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador)
		
		title = "Hemos sancionado a: " //+ modelObject.getJugadorADenunciar().getNombre()
		taskDescription = " Decidimos sansionarte" 
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = 
'''
En duelo de leyendas somos partidarios del fair play.
Gracias por ayudarnos a mantenernos así!!!
'''
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick = [ | this.close() ]
			disableOnError
		]
	}
}