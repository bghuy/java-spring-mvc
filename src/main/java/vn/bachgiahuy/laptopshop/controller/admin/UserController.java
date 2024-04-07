package vn.bachgiahuy.laptopshop.controller.admin;

import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.bachgiahuy.laptopshop.domain.Role;
import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.service.UploadService;
import vn.bachgiahuy.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arrUsers = this.userService.getAllUsers();
    // List<User> usersWithEmail =
    // this.userService.getAllUsersByEmail("admin@gmail.com");
    // model.addAttribute("eric", "user");
    // return "hello";
    // }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setFullName(user.getFullName());
            currentUser.setAddress(user.getAddress());
            currentUser.setPhone(user.getPhone());
            User savedUser = this.userService.saveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/create")
    public String createUser(@ModelAttribute("newUser") @Valid User newUser,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>" + error.getField() + "- " + error.getDefaultMessage());
        }
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleSaveUpLoadFile(file, "avatar");
        String hashedPassword = this.passwordEncoder.encode(newUser.getPassword());
        Role role = this.userService.getRoleByName(newUser.getRole().getName());
        newUser.setPassword(hashedPassword);
        newUser.setAvatar(avatar);
        newUser.setRole(role);
        User savedUser = this.userService.saveUser(newUser);
        return "redirect:/admin/user/create";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("user") User user) {
        System.out.println(user.toString());
        this.userService.deleteById(user.getId());
        return "redirect:/admin/user";
    }

}
