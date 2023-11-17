/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demostenes.trabajointegrador.models;
import java.io.Serializable;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Entity
@Table(name = "incidentes")
@Data
public class Incidentes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_incidente;

    @Column(name = "id_user")
    private int id_user;

    @Column(name = "id_cliente")
    private int id_cliente;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "fecha_alta")
    private LocalDate fecha_alta;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private Estado estado;

    @Column(name = "id_servicio")
    private int id_servicio;

    @Column(name = "id_tecnico")
    private int id_tecnico;

    @Column(name = "tiempoResuelto")
    private int tiempoResuelto;

    @Column(name = "esComplejo")
    private boolean esComplejo;

    @Column(name = "comentarios")
    private String comentarios;

    @Column(name = "emailEnviado")
    private boolean emailEnviado;

    @OneToMany(mappedBy = "incidente")
    private List<Problemas> listaProblemas = new ArrayList<>();

    public Incidentes() {
    }

    public Incidentes(int idUsuario, int id_Cliente, String Desc, Estado estado, int idServicio, int idTecnico) {
        this.id_user = idUsuario;
        this.id_cliente = id_Cliente;
        this.descripcion = Desc;
        this.estado = estado;
        this.id_servicio = idServicio;
        this.id_tecnico = idTecnico;
    }

}