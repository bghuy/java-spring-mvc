package vn.bachgiahuy.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.bachgiahuy.laptopshop.domain.Product;
import vn.bachgiahuy.laptopshop.domain.Role;
import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.service.ProductService;
import vn.bachgiahuy.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postMethodName(@ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult productBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = productBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + "- " + error.getDefaultMessage());
        }
        if (productBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        if (!file.isEmpty()) {
            String image = this.uploadService.handleSaveUpLoadFile(file, "product");
            newProduct.setImage(image);
        }

        Product product = this.productService.saveProduct(newProduct);
        return "redirect:/admin/product/create";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Product product = new Product();
        product.setId(id);
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("product") Product product) {
        this.productService.deleteById(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("newProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult productBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = productBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + "- " + error.getDefaultMessage());
        }
        if (productBindingResult.hasErrors()) {

            return "admin/product/update";
        }

        Product currentProduct = this.productService.getProductById(newProduct.getId());
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String image = this.uploadService.handleSaveUpLoadFile(file, "product");
                currentProduct.setImage(image);
            }
            currentProduct.setName(newProduct.getName());
            currentProduct.setPrice(newProduct.getPrice());
            currentProduct.setDetailDesc(newProduct.getDetailDesc());
            currentProduct.setShortDesc(newProduct.getShortDesc());
            currentProduct.setQuantity(newProduct.getQuantity());
            currentProduct.setFactory(newProduct.getFactory());
            currentProduct.setTarget(newProduct.getTarget());
            Product savedProduct = this.productService.saveProduct(currentProduct);
        }
        // Product currentProduct =
        // this.productService.getProductById(newProduct.getId());

        return "redirect:/admin/product";
    }

}
