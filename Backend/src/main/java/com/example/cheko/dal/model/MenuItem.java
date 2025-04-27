package com.example.cheko.dal.model;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "menu_items")
@Data
public class MenuItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //only in insert/update
    private Long id;
    private String name;
    private String description;
    private Integer calories;
    private double price;
    private Long category_id;
}
