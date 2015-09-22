package ar.edu.unq.ciu.dueloDeLeyendas.ui

import java.awt.Color
import jugador.Jugador
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class Denunciador extends SimpleWindow<Jugador>{
	
	String textoDenuncia
	String titulo
	
	new(WindowOwner owner, Jugador jugador, String textoDenuncia, String titulo) {
		super(owner, jugador)
		title = "Duelo de Leyendas"
		taskDescription = ""
		this.textoDenuncia = textoDenuncia
		this.titulo = titulo
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = titulo
			foreground = Color.WHITE
			background = Color.BLACK
			fontSize = 25
		]
		
		new Label(mainPanel) => [
			text = textoDenuncia
		]
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | this.close() ]
		]
	}
}