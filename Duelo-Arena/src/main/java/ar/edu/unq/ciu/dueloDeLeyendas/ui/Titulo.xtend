package ar.edu.unq.ciu.dueloDeLeyendas.ui

import java.awt.Color
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel

class Titulo {
	
	new(Panel panel, String titulo){
		new Label(panel) => [
			text = titulo
			foreground = Color.WHITE
			background = Color.BLACK
			fontSize = 25
		]
	} 
}