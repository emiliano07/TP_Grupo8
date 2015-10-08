package ar.edu.unq.ciu.dueloDeLeyendas.ui

import applicationModel.DueloApplicationModel
import applicationModel.JugadorApplicationModel
import java.awt.Color
import juego.NoHayContrincanteException
import juego.Personaje
import org.uqbar.arena.bindings.NotNullObservable
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
		new Titulo(mainPanel, "Selecciona tu personaje para el duelo!")
		
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
		
		crearLabelTituloSecundario(secondPanel, "Stats")
		
		new Panel(secondPanel) => [
			createTable(it)
		]
		
		var b2Panel = new Panel(secondPanel)
		
		crearLabelTituloCaracteristica(b2Panel, "Especialidades:")
		crearLabelCaracteristica(b2Panel, "personajeSeleccionado.especialidades")
		crearLabelTituloCaracteristica(b2Panel, "Debilidad:")
		crearLabelCaracteristica(b2Panel, "personajeSeleccionado.debilidades")
		crearLabelTituloCaracteristica(b2Panel, "Mejor Posición:")
		crearLabelCaracteristica(b2Panel, "personajeSeleccionado.posicionIdeal.nombre")
		
		var b3Panel = new Panel(secondPanel)
	
		var b3_1Panel = new Panel(b3Panel)
		b3_1Panel.setLayout(new ColumnLayout(2))
		
		crearPanelDeEstadisticas(b3_1Panel)
		
		crearLabelTituloSecundario(b3Panel, "Jugar")
		
		var b3_2Panel = new Panel(b3Panel)
		b3_2Panel.setLayout(new ColumnLayout(2))
		
		crearButton(b3_2Panel, "TOP", new Top)
		crearButton(b3_2Panel, "MID", new Mid)
		crearButton(b3_2Panel, "BOT", new Bot)
		crearButton(b3_2Panel, "JUNGLE", new Jungle)
	}
	
	/////////////////////////
	// BOTONES DE POSICIÓN //
	/////////////////////////
	def crearButton(Panel panel, String titulo, Posicion posicion){
		val elementSelected = new NotNullObservable("personajeSeleccionado")
		new Button(panel) => [
			caption = titulo
			onClick [ | this.jugar(posicion) ]
			bindEnabled(elementSelected)
			width = 75
			height = 20
		]
	}
	
	/////////////////////////
	///////// LABELS ////////
	/////////////////////////
	def crearLabelTituloSecundario(Panel panel, String titulo){
		new Label(panel) => [
			text = titulo
			foreground = Color.BLUE
			fontSize = 20
		]
	}
	
	def crearLabelTituloCaracteristica(Panel panel, String titulo){
		new Label(panel) => [
			text = titulo
			foreground = Color.GREEN
			fontSize = 15
		]
	}
	
	def crearLabelCaracteristica(Panel panel, String property){
		new Label(panel) => [
			bindValueToProperty(property)
			fontSize = 13
		]
	}

	/////////////////////////
	///// ESTADISTICAS //////
	/////////////////////////
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel).bindValueToProperty(property)
	}

	def crearPanelDeEstadisticas(Panel panel) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)	
			crearLabel(it,"Jugadas","estadisticasMomentaneas.cantUsado")
			crearLabel(it,"Ganadas","estadisticasMomentaneas.cantGanado")
			crearLabel(it,"Kills","estadisticasMomentaneas.kills")
			crearLabel(it,"Deads","estadisticasMomentaneas.deads")
			crearLabel(it,"Assists","estadisticasMomentaneas.assists")
			crearLabel(it,"Mejor ubicacion","estadisticasMomentaneas.mejorUbicacion.nombre")
			crearLabel(it,"Puntaje","estadisticasMomentaneas.calificacion.nombre")
		]
	}

	/////////////////////////
	///////// TABLA /////////
	/////////////////////////
	 def createTable(Panel panel){
		var table = new Table<Personaje>(panel, Personaje) => [
			bindItemsToProperty("personajesPosibles")
			bindValueToProperty("personajeSeleccionado")
		]
		
		new Column<Personaje>(table) => [
			title = "Personaje"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		
//		new Column<Personaje>(table) => [
//			title = "Puntaje"
//			fixedSize = 120
//			bindContentsToProperty("poderDeAtaque")
//		]
	}
	/////////////////////////
	/////////////////////////
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	def jugar(Posicion posicion){
		try{
			new ResultadoWindow(this,new DueloApplicationModel(modelObject.iniciarDuelo(posicion))).open()
		}
		catch(NoHayContrincanteException e){
			new NoTienesRivalWindow(this, modelObject.jugador).open()
		}
	}
}