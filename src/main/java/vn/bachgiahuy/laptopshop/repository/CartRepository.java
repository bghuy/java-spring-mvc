package vn.bachgiahuy.laptopshop.repository;

import org.springframework.stereotype.Repository;

import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
