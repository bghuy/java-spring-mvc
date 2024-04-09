package vn.bachgiahuy.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.CartDetail;
import vn.bachgiahuy.laptopshop.domain.Order;
import vn.bachgiahuy.laptopshop.domain.OrderDetail;
import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.repository.CartDetailRepository;
import vn.bachgiahuy.laptopshop.repository.CartRepository;
import vn.bachgiahuy.laptopshop.repository.OrderDetailRepository;
import vn.bachgiahuy.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> getAllOrders(Pageable page) {
        return orderRepository.findAll(page);
    }

    public Order fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteById(long id) {
        // TODO Auto-generated method stub
        Order order = this.orderRepository.findById(id);
        if (order != null) {
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            this.orderRepository.deleteById(id);
        }

    }

    public void updateOrder(Order order) {
        // TODO Auto-generated method stub
        Order currentOrder = this.orderRepository.findById(order.getId());
        if (currentOrder != null) {
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }

    }

    public long countOrder() {
        return this.orderRepository.count();
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

}
