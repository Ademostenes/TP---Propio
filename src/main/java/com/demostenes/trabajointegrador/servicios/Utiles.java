package com.demostenes.trabajointegrador.servicios;

public class Utiles {

	public static Strategy resolverStrategy(int rol) {
		Strategy respuesta = new RRHH();
		return respuesta;
	}
	
}