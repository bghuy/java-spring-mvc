package vn.bachgiahuy.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.bachgiahuy.laptopshop.domain.Cart;
import vn.bachgiahuy.laptopshop.domain.CartDetail;
import vn.bachgiahuy.laptopshop.domain.Product;
import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.repository.CartDetailRepository;
import vn.bachgiahuy.laptopshop.repository.CartRepository;
import vn.bachgiahuy.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product saveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }

            Product p = this.productRepository.findById(productId);
            if (p != null) {

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, p);
                // int sum=cart.getSum();
                // sum+=1;
                // cart.setSum(sum);

                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(p);
                    cartDetail.setPrice(p.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);
                    cart.setSum(cart.getSum() + 1);
                    int sum = cart.getSum() + 1;
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }

            }

        }

    }

}
