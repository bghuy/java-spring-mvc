package vn.bachgiahuy.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.bachgiahuy.laptopshop.domain.User;
import vn.bachgiahuy.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHelloWorld() {
        return "eric";
    }

    public User saveUser(User user) {
        return this.userRepository.save(user);
    }
}
