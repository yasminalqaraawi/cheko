package com.example.cheko.service;

import com.example.cheko.dal.model.Branch;
import com.example.cheko.dal.model.Category;
import com.example.cheko.dal.model.MenuItem;
import com.example.cheko.dal.repository.BranchRepository;
import com.example.cheko.dal.repository.CategoryRepository;
import com.example.cheko.dal.repository.MenuItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChekoServices {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private BranchRepository branchRepository;
    @Autowired
    private MenuItemRepository menuItemRepository;

    //get all menu items
    public List<MenuItem> getAllMenuItems() {
        return menuItemRepository.findAll();
    }

    //get all branches
    public List<Branch> getAllBranches() {
        return branchRepository.findAll();
    }

    //get all categories
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public List<MenuItem> getSecondMaxCaloriesMeal() {
        return menuItemRepository.findSecondMaxCaloriesByCategory();
    }

}
