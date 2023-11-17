/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demostenes.trabajointegrador.models;


import java.io.Serializable;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Entity
@Table(name = "clientes")
@Data
public class Clientes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_cliente;

    @Column(name = "id_user")
    private int id_user;

    @Column(name = "cuit")
    private String cuit;

    @Column(name = "razon_social")
    private String razonSocial;

    @Column(name = "email")
    private String email;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)
    private List<Serv_Contratados> listaServiciosContratados = new ArrayList<Serv_Contratados>();

    public Clientes() {}

}
