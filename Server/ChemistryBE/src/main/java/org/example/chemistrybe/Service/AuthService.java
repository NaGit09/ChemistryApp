package org.example.chemistrybe.Service;

import org.example.chemistrybe.Constant.Role;
import org.example.chemistrybe.Constant.UserConstant;
import org.example.chemistrybe.Repository.UserRepository;
import org.example.chemistrybe.Model.Users;
import org.example.chemistrybe.Utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

@Service
@CrossOrigin(origins = "*", maxAge = 3600)
// handle when ever controller receive a request from a client
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtils jwtUtil;

    public Users createUser(Users user) {
        user.setCreated_at(UserConstant.DEFAULT_CREATED_AT);
        user.setRole(Role.student);
        user.setPassword_hash(passwordEncoder.encode(user.getPassword_hash())); // mã hóa mật khẩu
        return userRepository.save(user);
    }

    public String login(String email, String password) {
        // 3) validation and check information from a database
        Users user = userRepository.findByEmail(email)
                .orElseThrow(() ->
                        // 4) not found user in database
                        new UsernameNotFoundException("Email not found"));
        // 7) found and check password from a database
        if (!passwordEncoder.matches(password, user.getPassword_hash())) {
            throw new BadCredentialsException("Invalid password");
        }
        //8) generate token
        return jwtUtil.generateToken(user.getEmail());
    }
}
