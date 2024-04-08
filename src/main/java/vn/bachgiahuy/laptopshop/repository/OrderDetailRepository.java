
package vn.bachgiahuy.laptopshop.repository;

import org.springframework.stereotype.Repository;

import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.CartDetail;
import vn.bachgiahuy.laptopshop.domain.Order;
import vn.bachgiahuy.laptopshop.domain.OrderDetail;
import vn.bachgiahuy.laptopshop.domain.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
