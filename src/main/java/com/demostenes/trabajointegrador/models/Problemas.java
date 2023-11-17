package com.demostenes.trabajointegrador.models;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Entity
@Table(name = "problemas")
@Data
public class Problemas implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_problema;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_incidente")
    private Incidentes incidente;

    @Column(name = "desc_problema")
    private String desc_problema;

    @Column(name = "tiempoEsperadoMin")
    private int tiempoEsperadoMin;

    @Column(name = "tiempoMaximoMin")
    private int tiempoMaximoMin;

}