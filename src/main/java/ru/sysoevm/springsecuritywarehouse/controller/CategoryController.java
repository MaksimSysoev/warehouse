package ru.sysoevm.springsecuritywarehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.sysoevm.springsecuritywarehouse.model.Category;
import ru.sysoevm.springsecuritywarehouse.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/auth")
public class CategoryController {

    private CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/categories")
    public String findAll(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "categories";
    }

    @PostMapping("/categories/{id}")
    public String updateCategory(Category category, @PathVariable("id") Long id, Model model) {
        categoryService.update(id, category);
        return "redirect:/auth/categories";
    }


    @GetMapping("/category-create")
    public String createCategoryForm(Category category) {
        return "category-create";
    }

    @PostMapping("/category-create")
    public String createCategory(Category category, Model model) {

        if (categoryService.findByName(category.getName())!=null) {
            model.addAttribute("errorMessage", "Такая категория существует!");
            return "/category-create";
        }

        categoryService.saveCategory(category);
        return "redirect:/auth/categories";
    }

    @PostMapping("/category-delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id) {
        Category delCategory = categoryService.findById(id);
        delCategory.getProducts().removeIf(p -> p!=null);
        categoryService.deleteById(id);
        return "redirect:/auth/categories";
    }



}
