
package vn.bachgiahuy.laptopshop.repository;

import org.springframework.stereotype.Repository;

import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.CartDetail;
import vn.bachgiahuy.laptopshop.domain.Order;
import vn.bachgiahuy.laptopshop.domain.User;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    public Order findById(long id);

    public void deleteById(long id);

    public List<Order> findByUser(User user);

    List<Order> findAll();

    Page<Order> findAll(Pageable page);
}
