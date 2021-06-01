package ru.sysoevm.springsecuritywarehouse.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import ru.sysoevm.springsecuritywarehouse.model.Product;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findByName(String name);
}
