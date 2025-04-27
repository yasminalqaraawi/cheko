package com.example.cheko.dal.model;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "branches")
@Data
public class Branch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //only in insert/update
    private Long id;
    private String district;
    private String opening_hours;
    private double latitude;
    private double longitude;
}
