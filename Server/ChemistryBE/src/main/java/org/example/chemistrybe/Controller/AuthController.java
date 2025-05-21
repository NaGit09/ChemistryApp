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
//  handle request from a client
public class AuthController {
    @Autowired
    private AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<Users> createUser(@Valid @RequestBody Users user) {
        return ResponseEntity.ok(authService.createUser(user));
    }
    // 1) get body from a client request
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody Users user) {
        try {
            //2) call login in service
            String token = authService.login(user.getEmail(), user.getPassword_hash());
            ResponseCookie cookie =ResponseCookie.from("token", token)
                    .httpOnly(true)
                    .secure(false)
                    .path("/") // ✔ path này bao phủ mọi URL
                    .maxAge(3600)
                    .sameSite("Strict")
                    .build();
            // send token from server to client
            return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString()).body("Login successful");
        } catch (Exception e) {
            // 5) incorrect information
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
