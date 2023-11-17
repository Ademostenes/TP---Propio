/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demostenes.trabajointegrador.models;


import java.io.Serializable;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import lombok.*;

@Entity
@Table(name = "serv_contratados")
@Data
public class Serv_Contratados implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_servContratado;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_cliente", nullable = false)
    private Clientes cliente;

    @OneToMany(mappedBy = "serv_contratado", cascade = CascadeType.ALL)
    private List<Servicios> listaServiciosContratados = new ArrayList<>();

    public Serv_Contratados() {}

}
