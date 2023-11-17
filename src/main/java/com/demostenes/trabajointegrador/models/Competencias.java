package com.demostenes.trabajointegrador.models;


import java.io.Serializable;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Entity
@Table(name = "competencias")
@Data
public class Competencias implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_competencia;

    @OneToMany(mappedBy = "competencia", cascade = CascadeType.ALL)
    private List<Servicios> servicios = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_tecnico", nullable = false)
    private Tecnicos id_tecnico;

    public Competencias() {}

}
