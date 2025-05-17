package org.example.chemistrybe.Service;

import org.example.chemistrybe.Model.Chemicals;
import org.example.chemistrybe.Repository.ChemicalsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@EnableMethodSecurity(prePostEnabled = true)
public class ChemicalsService {
    @Autowired
    private final ChemicalsRepository chemicalsRepository;

    public ChemicalsService(ChemicalsRepository chemicalsRepository) {
        this.chemicalsRepository = chemicalsRepository;
    }

    public List<Chemicals> findAll(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("Auth info: " + auth);
        return chemicalsRepository.findAll();
    }
    public Chemicals findById(Long id){
        return chemicalsRepository.findById(id).orElse(null);
    }

}
