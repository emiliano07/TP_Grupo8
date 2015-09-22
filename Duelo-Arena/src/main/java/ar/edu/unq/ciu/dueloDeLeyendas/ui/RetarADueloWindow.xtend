package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DueloApplicationModel
import applicationModel.JugadorApplicationModel
import java.awt.Color
import juego.NoHayContrincanteException
import juego.Personaje
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import posicion.Bot
import posicion.Jungle
import posicion.Mid
import posicion.Posicion
import posicion.Top

class RetarADueloWindow extends SimpleWindow<JugadorApplicationModel>{
	
	new(WindowOwner parent, JugadorApplicationModel jugador) {
		super(parent, jugador)
		title = "Duelo de Leyendas"
		taskDescription =  "Bienvenido: " + jugador.jugador.nombre + "! Desde esta pantalla podras elegir un personaje para batirte a duelo con otro jugador. Recuerda siempre revisar tus stats!" 
	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Selecciona tu personaje para el duelo!"
			foreground = Color.WHITE
			background = Color.BLACK
			fontSize = 25
		]
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(3))
		
		var a1Panel = new Panel(secondPanel)
		a1Panel.setLayout(new ColumnLayout(2))
		
		new Label(a1Panel) => [
			text = "Personaje Buscado:"
		]
		
		new TextBox(a1Panel) => [
			bindValueToProperty("personajeBuscado")
			width = 125
		]
		
		new Label(secondPanel) => [
			bindValueToProperty("personajeSeleccionado.nombre")
			foreground = Color.BLUE
			fontSize = 20
		]
		
		new Label(secondPanel) => [
			text = "Stats"
			foreground = Color.BLUE
			fontSize = 20
		]
		
		new Panel(secondPanel) => [
			createTable(it)
		]
		
		var b2Panel = new Panel(secondPanel)
		
		new Label(b2Panel) => [
			text = "Especialidades:"
			foreground = Color.GREEN
			fontSize = 15
		]
		
		new Label(b2Panel) => [
			bindValueToProperty("personajeSeleccionado.especialidades")
			fontSize = 13
		]
		
		new Label(b2Panel) => [
			text = "Debilidad:"
			foreground = Color.GREEN
			fontSize = 15
		]
		
		new Label(b2Panel) => [
			bindValueToProperty("personajeSeleccionado.debilidades")
			fontSize = 13
		]
		
		new Label(b2Panel) => [
			text = "Mejor Posición:"
			foreground = Color.GREEN
			fontSize = 15
		]
		
		new Label(b2Panel) => [
			bindValueToProperty("personajeSeleccionado.posicionIdeal.nombre")
			fontSize = 13
		]
		
		var b3Panel = new Panel(secondPanel)
	
		var b3_1Panel = new Panel(b3Panel)
		b3_1Panel.setLayout(new ColumnLayout(2))
		
		crearPanelDeEstadisticas(b3_1Panel)
		
		new Label(b3Panel) => [
			text = "Jugar"
			foreground = Color.BLUE
			fontSize = 20
		]
		
		var b3_2Panel = new Panel(b3Panel)
		b3_2Panel.setLayout(new ColumnLayout(2))
		
		new Button(b3_2Panel) => [
			caption = "TOP"
			setAsDefault
			onClick [ | this.seleccionarPosicion(new Top()) ]
			disableOnError
			width = 75
			height = 20
		]
		
		new Button(b3_2Panel) => [
			caption = "MID"
			setAsDefault
			onClick [ | this.seleccionarPosicion(new Mid()) ]
			disableOnError
			width = 75
			height = 20
		]
		
		new Button(b3_2Panel) => [
			caption = "BOT"
			setAsDefault
			onClick [ | this.seleccionarPosicion(new Bot()) ]
			disableOnError
			width = 75
			height = 20
		]
		
		new Button(b3_2Panel) => [
			caption = "JUNGLE"
			setAsDefault
			onClick [ | this.seleccionarPosicion(new Jungle()) ]
			disableOnError
			width = 75
			height = 20
		]
	}
	 
	def crearPanelDeEstadisticas(Panel panel) {
		estadisticPanel(panel)
	}	
	
	def estadisticPanel(Panel panel) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)		
			crearLabel(it,"Jugadas","estadisticasPersonajeSeleccionado.cantUsado")
			crearLabel(it,"Ganadas","estadisticasPersonajeSeleccionado.cantGanado")
			crearLabel(it,"Kills","estadisticasPersonajeSeleccionado.kills")
			crearLabel(it,"Deads","estadisticasPersonajeSeleccionado.deads")
			crearLabel(it,"Assists","estadisticasPersonajeSeleccionado.assists")
			crearLabel(it,"Mejor ubicacion","estadisticasPersonajeSeleccionado.mejorUbicacion.nombre")
			crearLabel(it,"Puntaje","estadisticasPersonajeSeleccionado.calificacion.nombre")
		]		
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel).bindValueToProperty(property)
	}
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	def seleccionarPosicion(Posicion posicion){
		try{
			modelObject.seleccionarPosicion(posicion)
			new ResultadoWindow(this,new DueloApplicationModel(modelObject.dueloActivo)).open()
		}
		catch(NoHayContrincanteException e){
			new NoTienesRivalWindow(this, modelObject.jugador).open()
		}
	}
	
	/////TABLE//////
	 def createTable(Panel panel){
		var table = new Table<Personaje>(panel, Personaje) => [
			bindItemsToProperty("personajesActivados")
			bindValueToProperty("personajeSeleccionado")
		]
		
		new Column<Personaje>(table) => [
			title = "Personaje"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		
		new Column<Personaje>(table) => [
			title = "Puntaje"
			fixedSize = 120
			bindContentsToProperty("poderDeAtaque")
		]
	}
}