package applicationModel

import java.util.List
import juego.Duelo
import juego.EstadisticasMomentaneas
import juego.Juego
import juego.Personaje
import jugador.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class JugadorApplicationModel {
	
	var Juego juego
	var Jugador jugador
	var Personaje personajeSeleccionado
	var String personajeBuscado
	var EstadisticasMomentaneas estadisticasMomentaneas
	
	new(Juego juego,  Jugador jugador){
		this.juego = juego
		this.jugador = jugador
		this.personajeSeleccionado = null
		this.personajeBuscado = ""
		this.estadisticasMomentaneas = new EstadisticasMomentaneas(this.jugador.estadisticas,new Personaje("","","",null,juego.centroDeCalificaciones),this.jugador,this.juego.centroDeCalificaciones)
	}
	
	def getPoderDeAtaque(){
		this.jugador.getPoderDeAtaque(personajeSeleccionado)
	}
	
	def List<Personaje> getPersonajesPosibles(){
		if(this.personajeBuscado=="")
			this.juego.personajes
		else{	
			this.juego.personajes.filter[it.nombre.startsWith(personajeBuscado)].toList
		}
	}
	
	def setPersonajeBuscado(String nombre){
		this.personajeBuscado = nombre
		ObservableUtils.firePropertyChanged(this, "personajesPosibles")
	}
	
	def Duelo iniciarDuelo(Posicion posicion) {
		jugador.iniciarDuelo()
		jugador.dueloActivo.seleccionarPersonaje(this.personajeSeleccionado)
		jugador.dueloActivo.seleccionarPosicion(posicion)
		return jugador.dueloActivo
	}
	
	def void setPersonajeSeleccionado(Personaje personaje){
		this.personajeSeleccionado = personaje
		this.estadisticasMomentaneas = new EstadisticasMomentaneas(this.jugador.estadisticas,this.personajeSeleccionado,this.jugador,this.juego.centroDeCalificaciones)
		ObservableUtils.firePropertyChanged(this, "estadisticasMomentaneas", personajesPosibles)
	}
}