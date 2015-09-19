package denuncia

abstract class Motivo {
	
	String nombre;
	
	new(String nombre){
		this.nombre = nombre;
	}
    
    def abstract int peso()
 }