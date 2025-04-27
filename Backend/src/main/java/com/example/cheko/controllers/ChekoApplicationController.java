package com.example.cheko.controllers;
import com.example.cheko.dal.model.Branch;
import com.example.cheko.dal.model.Category;
import com.example.cheko.dal.model.MenuItem;
import com.example.cheko.service.ChekoServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@RestController
//@RequestMapping("/")
public class ChekoApplicationController {
    @Autowired
    private ChekoServices chekoServices;

    @GetMapping("/categories")
    public List<Category> getAllCategories() {
        return chekoServices.getAllCategories();
    }

    @GetMapping("/branches")
    public List<Branch> getAllBranches() {
        return chekoServices.getAllBranches();
    }

    @GetMapping("/menuItems")
    public List<MenuItem> getAllMenuItems() {
        return chekoServices.getAllMenuItems();
    }

    @GetMapping("/menuItems/secondHighest")
    public List<MenuItem> getSecondMaxCaloriesMeal() {
        return chekoServices.getSecondMaxCaloriesMeal();
    }

    @GetMapping("/")
    public String healthCheck() {
        return "ChekoServices Is Running.";
    }

}

