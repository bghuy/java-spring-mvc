package vn.bachgiahuy.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.bachgiahuy.laptopshop.domain.Product;
import vn.bachgiahuy.laptopshop.domain.User;

@Controller
public class ProductController {
    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

}
