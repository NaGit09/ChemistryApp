package org.example.chemistrybe.Service;

import org.example.chemistrybe.DTO.Element;
import org.example.chemistrybe.Model.Chemical;
import org.example.chemistrybe.Repository.ChemicalsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@EnableMethodSecurity(prePostEnabled = true)
public class ChemicalsService {
    @Autowired
    private final ChemicalsRepository chemicalsRepository;

    public ChemicalsService(ChemicalsRepository chemicalsRepository) {
        this.chemicalsRepository = chemicalsRepository;
    }

    public List<Element> getAllElement() {
        List<Chemical> chemicals = chemicalsRepository.findAll();
        List<Element> result = new ArrayList<>();
        for (Chemical chemical : chemicals) {
            result.add(new Element(
                    chemical.getId(), chemical.getName(), chemical.getAtomic_weight(), chemical.getSymbol(), chemical.getType().getId())
            );
        }
        return result;
    }

    public Element findByNameElement(String name) {
        Chemical Chemical = chemicalsRepository.findByName(name);
        return new Element(Chemical.getId(), Chemical.getName(), Chemical.getAtomic_weight(), Chemical.getSymbol(), Chemical.getType().getId());
    }

    public List<Chemical> findAll() {
        return chemicalsRepository.findAll();
    }

    public Chemical findByName(String name) {
        return chemicalsRepository.findByName(name);
    }

    public Chemical findById(Long id) {
        return chemicalsRepository.findById(id).orElse(null);
    }

}
