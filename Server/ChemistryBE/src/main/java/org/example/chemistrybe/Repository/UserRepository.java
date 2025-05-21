package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
// Handle users query
public interface UserRepository extends JpaRepository<Users, Long> {
public Optional<Users> findByEmail(String email);
}
