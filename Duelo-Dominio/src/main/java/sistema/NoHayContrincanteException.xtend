package sistema

class NoHayContrincanteException extends Exception {
	
	new(){
		throw new Exception("No hay contrincante")
	}
}