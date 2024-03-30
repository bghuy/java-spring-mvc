package vn.bachgiahuy.laptopshop.repository;

import org.springframework.stereotype.Repository;
import vn.bachgiahuy.laptopshop.domain.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    void deleteById(long id);

    Product findById(long id);

    List<Product> findAll();
}
