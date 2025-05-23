package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
// Handle users query
public interface UserRepository extends JpaRepository<Users, Long> {
public Optional<Users> findByEmail(String email);
}
