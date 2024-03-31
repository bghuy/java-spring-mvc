package vn.bachgiahuy.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import vn.bachgiahuy.laptopshop.service.validator.RegisterChecked;

@RegisterChecked
public class RegisterDTO {
    @Size(min = 3, message = "first name must have at least 3 characters")
    private String firstName;
    private String lastName;

    @Email(message = "Email is not valid", regexp = "^[a-zA-Z0-9-_\\.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")
    private String email;

    private String password;

    @Size(min = 3, message = "confirm password must have at least 3 characters")
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
