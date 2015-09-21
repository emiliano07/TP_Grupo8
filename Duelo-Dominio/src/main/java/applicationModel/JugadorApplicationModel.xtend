package applicationModel

import java.util.List
import juego.Duelo
import juego.Estadisticas
import juego.Jugador
import juego.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import posicion.Posicion

@Observable
@Accessors class JugadorApplicationModel {
	
	var Jugador jugador
	var Personaje personajeSeleccionado
	var List<Personaje> personajesActivados
	var Duelo dueloActivo
	var String personajeBuscado
	
	new(Jugador jugador){
		this.jugador = jugador
		this.personajesActivados = this.jugador.juego.personajesActivados
		this.personajeSeleccionado = this.personajesActivados.get(0)
		this.dueloActivo = this.jugador.dueloActivo
		this.personajeBuscado = ""
	}
	
	def Estadisticas getEstadisticas(){
		this.personajeSeleccionado.estadisticas
	}
	
	def seleccionarPosicion(Posicion posicion){
		this.jugador.seleccionarPosicion(this.dueloActivo, posicion)
	}
	
	def buscadorDePersonajes(String s){
		var List<Personaje> personajesBuscados = newArrayList
		if(this.personajeBuscado == "")
			this.personajesActivados = this.jugador.juego.personajesActivados
		else{	
			for (Personaje per : this.jugador.juego.personajesActivados){
				if(per.nombre.startsWith(s))
					personajesBuscados.add(per)
			}
			this.personajesActivados = personajesBuscados
		}
	}
	
	def setPersonajeBuscado(String nombre){
		this.personajeBuscado = nombre
		ObservableUtils.firePropertyChanged(this, "personajeSeleccionado", this.buscadorDePersonajes(nombre))
	}
	
	def void setPersonajeSeleccionado(Personaje personaje){
		this.personajeSeleccionado = personaje
		this.jugador.seleccionarPersonaje(this.dueloActivo, personaje)
	}
}