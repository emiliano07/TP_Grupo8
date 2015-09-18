package ar.edu.unq.ciu.dueloDeLeyendas.ui

import juego.Jugador
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class HasSidoSancionadoWindow extends SimpleWindow<Jugador> {
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador)

		title = "Has sido sancionado!"
		taskDescription = "Estas sansionado"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout
		
		new Label(mainPanel).text = 
''' 
Hemos detectado que tu denuncia no tiene fundamentos sólidos.
En duelo de leyendas desalentamos este tipo de actitudes y somos partidarios del fair play.
Con lo que has recibido una sanción por tu actitud antideportiva, esperamos que reflexiones sobre tu actitud
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