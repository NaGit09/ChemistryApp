package org.example.chemistrybe.Secure;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.chemistrybe.Repository.UserRepository;
import org.example.chemistrybe.Model.Users;
import org.example.chemistrybe.Utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUtils jwtUtil;

    @Autowired
    private UserRepository userRepository;
    // Authentication when ever receive a request
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String path = request.getRequestURI();

        // Danh sách các path được phép truy cập mà không cần JWT
        if (path.startsWith("/User")
                || path.startsWith("/Chemiscals")
                || path.startsWith("/Experiment")
                || path.equals("/")) {
            filterChain.doFilter(request, response); // Bỏ qua xác thực
            return;
        }

        String token = null;
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            token = authHeader.substring(7);
        } else {
            if (request.getCookies() != null) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().equals("token")) {
                        token = cookie.getValue();
                        break;
                    }
                }
            }
        }

        if (token != null) {
            try {
                if (jwtUtil.validateToken(token)) {
                    String email = jwtUtil.extractUsername(token);
                    Users user = userRepository.findByEmail(email)
                            .orElseThrow(() -> new UsernameNotFoundException("User not found"));
                    UserDetails userDetails = new org.springframework.security.core.userdetails.User(
                            user.getEmail(),
                            user.getPassword_hash(),
                            List.of(new SimpleGrantedAuthority("ROLE_" + user.getRole().name()))
                    );

                    UsernamePasswordAuthenticationToken authToken =
                            new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authToken);
                }
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("Invalid or expired JWT token");
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

}

