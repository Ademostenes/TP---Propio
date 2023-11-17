package com.demostenes.trabajointegrador.servicios;

import com.demostenes.trabajointegrador.models.Usuarios;
import java.util.Scanner;

public class Menu {

    private final Strategy strategy;

    public Menu(Strategy strategy) {
        this.strategy = strategy;
    }

    public void render() {
        strategy.render();
    }
    
    public void altausuarios() {
    	Usuarios user = new Usuarios();
        try (Scanner leer = new Scanner(System.in)) {
            System.out.println("Ingrese el DNI del usuario: ");
            user.setDni(leer.nextLine());
            System.out.println("Ingrese el nombre del usuario: ");
            user.setNombre(leer.nextLine());
            System.out.println("Ingrese el apellido del usuario: ");
            user.setApellido(leer.nextLine());
        }
    	   	
    }
}