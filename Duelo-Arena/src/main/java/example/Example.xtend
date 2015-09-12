package example

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import sistema.Personaje

class Example extends SimpleWindow<Personaje> {
	
	new(WindowOwner parent, Personaje model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}