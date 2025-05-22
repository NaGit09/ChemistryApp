package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.Type;
import org.hibernate.type.descriptor.converter.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeRepository extends JpaRepository<Type , Integer> {
}
