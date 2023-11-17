package com.demostenes.trabajointegrador.models;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "usuarios")
public class Usuarios implements Serializable {

    @Id
    private String dni;

    @Column(name = "pwd")
    private String pwd;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_rol")
    private Roles id_rol;

    @Column(name = "email")
    private String email;

    public Usuarios() {}

    public Usuarios(String dni, String pwd, String nombre, String apellido, Roles rol, String email) {
        this.dni = dni;
        this.pwd = pwd;
        this.nombre = nombre;
        this.apellido = apellido;
        this.id_rol = rol;
        this.email = email;
    }
}
