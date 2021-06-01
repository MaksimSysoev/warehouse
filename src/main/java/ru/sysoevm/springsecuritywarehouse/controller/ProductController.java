package ru.sysoevm.springsecuritywarehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.sysoevm.springsecuritywarehouse.model.Category;
import ru.sysoevm.springsecuritywarehouse.model.Product;
import ru.sysoevm.springsecuritywarehouse.service.CategoryService;
import ru.sysoevm.springsecuritywarehouse.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/auth")
public class ProductController {

    private final ProductService productService;
    private final CategoryService categoryService;

    @Autowired
    public ProductController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @GetMapping("/products")
    public String findAll(Model model) {
        model.addAttribute("products", productService.findAll());
        model.addAttribute("categories", categoryService.findAll());
        return "products";
    }

    @GetMapping("/products/{id}")
    public String findProductsById(@PathVariable("id") Long id, Model model) {

        if (categoryService.findById(id)==null) {
            model.addAttribute("errorMessage", "Такой категории не существует!");
            return "redirect:/auth/404";
        }

        Category category = categoryService.findById(id);

        model.addAttribute("category", categoryService.findById(id));
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("id", id);
        return "product-create";
    }


    @PostMapping("/products/{id}")
    public String createProduct(
            Category category,
            Product product,
            @RequestParam("file") MultipartFile file,
            Model model) throws IOException {

        if (productService.findByName(product.getName())!=null) {
            model.addAttribute("errorMessage", "Такой продукт уже существует!");
            return "redirect:/auth/products/{id}";
        }

        Product saveProduct = new Product();
        saveProduct.setImg(productService.upload(file));
        saveProduct.setName(product.getName());
        saveProduct.setDescr(product.getDescr());
        saveProduct.setPrice(product.getPrice());
        saveProduct.setCount(product.getCount());
        saveProduct.setCategory(category);
        productService.saveProduct(saveProduct);

        return "redirect:/auth/products/{id}";
    }

    @GetMapping("/product-edit/{id}")
    public String getProduct(Product product, @PathVariable("id") Long id, Model model) {
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("image", productService.findById(id).getImg());
        return "product-edit";
    }

    @GetMapping("/product-edit")
    public String errorUpdateProduct(Product product) {
        return "product-edit";
    }

    @PostMapping("/product-edit/{id}")
    public String updateProduct(Product updProduct,
                                @PathVariable("id") Long id,
                                @RequestParam("file") MultipartFile file,
                                Model model) throws IOException {
        Product product = productService.findById(id);
        if (file.isEmpty()) {
            updProduct.setImg(product.getImg());
        } else {
            updProduct.setImg(productService.upload(file));
        }
        productService.saveProduct(updProduct);
        return "redirect:/auth/products/" + product.getCategory().getId();
    }

    @PostMapping("/product-delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id) {
        Product delProduct = productService.findById(id);
        productService.deleteProduct(delProduct);
        return "redirect:/auth/products/"+delProduct.getCategory().getId();
    }

    @GetMapping("/404")
    public String productNotFound() {
        return "404";
    }

    
}
