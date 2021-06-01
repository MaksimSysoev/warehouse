package ru.sysoevm.springsecuritywarehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.sysoevm.springsecuritywarehouse.model.Category;
import ru.sysoevm.springsecuritywarehouse.repository.CategoryRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public Category findById(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    public Category findByName(String name) {
        return categoryRepository.findByName(name).orElse(null);
    }

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public void deleteById(Long id) {
        categoryRepository.deleteById(id);
    }

    public void update(Long id, Category category) {
        Category categoryToBeUpdated = findById(id);
        categoryToBeUpdated.setName(category.getName());
        categoryToBeUpdated.setDescr(category.getDescr());
        categoryRepository.flush();
    }



}
