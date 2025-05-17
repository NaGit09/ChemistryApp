package org.example.chemistrybe.Controller;

import jakarta.servlet.http.Cookie;
import jakarta.validation.Valid;
import org.example.chemistrybe.Model.Users;
import org.example.chemistrybe.Service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/User")
public class AuthController {
    @Autowired
    private AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<Users> createUser(@Valid @RequestBody Users user) {
        return ResponseEntity.ok(authService.createUser(user));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody Users user) {
        try {
//            Create a cookie sent to a client
            String token = authService.login(user.getEmail(), user.getPassword_hash());
            ResponseCookie cookie =ResponseCookie.from("token", token)
                    .httpOnly(true)
                    .secure(false)
                    .path("/") // ✔ path này bao phủ mọi URL
                    .maxAge(3600)
                    .sameSite("Strict")
                    .build();
            return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString()).body("Login successful");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
