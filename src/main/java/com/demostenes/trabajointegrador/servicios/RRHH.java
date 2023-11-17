package com.demostenes.trabajointegrador.servicios;

import java.util.Scanner;

	public class RRHH implements Strategy {
		Scanner leer = new Scanner(System.in);
		int opt;

	    @Override
	    public void render() {
	        System.out.println("	Menú recursos humanos:");
	        System.out.println();
	        System.out.println("	1- * Altas de usuarios");
	        System.out.println("	2- * Bajas de usuarios");
	        System.out.println("	3- * Modificacion de usuarios");
	        System.out.println("	4- * Reportes");
	        System.out.println("	5- * Salir del sistema (Logout)");
	        System.out.println();
	        System.out.println("	* Ingrese su opción: ");
	        opt = leer.nextInt();
	        
	        
	    }
	}