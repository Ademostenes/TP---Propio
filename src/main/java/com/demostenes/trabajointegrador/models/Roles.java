package com.demostenes.trabajointegrador.models;


import javax.persistence.*;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import lombok.Data;

@Data
@Entity
@Table(name = "roles")
@Inheritance(strategy = InheritanceType.JOINED)
public class Roles extends Permisos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_rol;

    @Column(name = "des_rol")
    private String des_rol;

    @Column(name = "id_permisos")
    private int id_permisos;

    public Roles() {
    }

    public Roles(String desc, int permiso) {
        super();
        this.setDes_rol(desc);
        this.setId_permisos(permiso);
    }

}
