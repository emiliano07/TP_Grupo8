package ar.edu.unq.ciu.dueloDeLeyendas.ui.AplicarDenuncia

import juego.Jugador
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class Denunciador extends SimpleWindow<Jugador>{
	
	String textoDenuncia
	
	new(WindowOwner owner, Jugador jugador, String textoDenuncia, String titulo) {
		super(owner, jugador)
		title = titulo
		this.textoDenuncia = textoDenuncia
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(1)
			new Label(it).setText(textoDenuncia)
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
	