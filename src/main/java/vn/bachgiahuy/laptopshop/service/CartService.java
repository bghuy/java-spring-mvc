package vn.bachgiahuy.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.CartDetail;
import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.repository.CartDetailRepository;
import vn.bachgiahuy.laptopshop.repository.CartRepository;

@Service
public class CartService {

    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public CartService(CartRepository cartRepository, CartDetailRepository cartDetailRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Cart fetchByUser(User user) {

        return this.cartRepository.findByUser(user);

    }

    public List<CartDetail> getCartDetailByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);

    }

}
