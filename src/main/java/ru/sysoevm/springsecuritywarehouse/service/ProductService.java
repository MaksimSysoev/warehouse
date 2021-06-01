package ru.sysoevm.springsecuritywarehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.sysoevm.springsecuritywarehouse.model.Product;
import ru.sysoevm.springsecuritywarehouse.repository.ProductRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {

    @Value("${upload.path}")
    private String uploadPath;

    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    public Product findByName(String name) {
        return productRepository.findByName(name).orElse(null);
    }

    public Product saveProduct(Product product) {
        return  productRepository.save(product);
    }

    public Product findById(Long id) {
        return  productRepository.findById(id).orElse(null);
    }

    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    public String upload(MultipartFile file) throws IOException {
        if(file.isEmpty()) {
            return "image-default.jpg";
        }
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "." + file.getOriginalFilename();
        file.transferTo(new File(uploadPath + "/" + resultFileName));

        return resultFileName;
    }


}
