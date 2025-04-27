package com.example.cheko.dal.model;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "categories")
@Data
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //only in insert/update
    private Long id;
    private String name;
}
