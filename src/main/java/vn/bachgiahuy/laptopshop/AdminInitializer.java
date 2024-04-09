package vn.bachgiahuy.laptopshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.repository.UserRepository;
import vn.bachgiahuy.laptopshop.service.UserService;

@Component
public class AdminInitializer implements ApplicationRunner {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public AdminInitializer(UserService userService, PasswordEncoder passwordEncoder, UserRepository userRepository) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (!userRepository.existsByEmail("laptopshopAdmin@gmail.com")) {
            User admin = new User();
            admin.setEmail("laptopshopAdmin@gmail.com");
            admin.setFullName("laptopshop admin");
            admin.setPassword(passwordEncoder.encode("admin123"));// Mật khẩu được mã hóa trước khi lưu vào cơ sở dữ
                                                                  // liệu
            admin.setRole(this.userService.getRoleByName("ADMIN")); // Đặt quyền hạn cho tài khoản admin
            userRepository.save(admin);
        }
    }

}
