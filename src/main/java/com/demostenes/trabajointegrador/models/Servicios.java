
package com.demostenes.trabajointegrador.models;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@Entity
@Table(name = "servicios")
@Data
public class Servicios implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_servicio;

    @Column(name = "desc_servicio")
    private String desc_servicio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "serv_contratado", nullable = false)
    private Serv_Contratados serv_contratado;

    public Servicios() {
    }

    public Servicios(String desc_servicio) {
        this.desc_servicio = desc_servicio;
    }

}