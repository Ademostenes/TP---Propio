package com.demostenes.trabajointegrador.models;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;
@Data

public class Tecnicos extends Usuarios {
        private int id_user;
	private List<Competencias> competencia = new ArrayList<>();
        
        public Tecnicos(){
        }
	
}

