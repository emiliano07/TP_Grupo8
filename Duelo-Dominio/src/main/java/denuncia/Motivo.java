package denuncia;

import org.uqbar.commons.utils.Observable;

@Observable
public enum Motivo {
	
	AbusoDeHabilidad("Abuso de Habilidad",5),
	AbusoDelSistemaDeDenuncias("Abuso del Sistema de Denuncias", 25), 
	ComunicacionAbusiva("Comunicacion Abusiva", 7), 
	FeedIntencional("Feed Intencional", 10);
	
	private String nombre;
	private int peso;
	
	Motivo (String nombre, int peso){
		this.nombre = nombre;
		this.peso = peso;
	}
	
	public String getNombre(){
		return this.nombre;
	}
	
	public  int getPeso(){
		return this.peso;
	}
}