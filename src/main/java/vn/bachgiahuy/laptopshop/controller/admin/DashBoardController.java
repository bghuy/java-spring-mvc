package vn.bachgiahuy.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.bachgiahuy.laptopshop.service.OrderService;
import vn.bachgiahuy.laptopshop.service.ProductService;
import vn.bachgiahuy.laptopshop.service.UserService;

@Controller
public class DashBoardController {
    private final UserService userService;
    private final ProductService productService;
    private final OrderService orderService;

    public DashBoardController(UserService userService, ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countProduct", this.productService.countProduct());
        model.addAttribute("countOrder", this.orderService.countOrder());
        return "admin/dashboard/show";
    }
}
