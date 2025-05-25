package org.example.chemistrybe.service;

import org.example.chemistrybe.dto.Element;
import org.example.chemistrybe.model.Chemicals;
import org.example.chemistrybe.repository.ChemicalsRepository;
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
        List<Chemicals> chemicals = chemicalsRepository.findAll();
        List<Element> result = new ArrayList<>();
        for (Chemicals chemical : chemicals) {
            result.add(new Element(
                    chemical.getId(), chemical.getName(), chemical.getAtomic_weight(), chemical.getSymbol(), chemical.getType_id())
            );
        }
        return result;
    }

    public Element findByNameElement(String name) {
        Chemicals Chemical = chemicalsRepository.findByName(name);
        return new Element(Chemical.getId(), Chemical.getName(), Chemical.getAtomic_weight(), Chemical.getSymbol(), Chemical.getType_id());
    }

    public List<Chemicals> findAll() {
        return chemicalsRepository.findAll();
    }

    public Chemicals findByName(String name) {
        return chemicalsRepository.findByName(name);
    }

    public Chemicals findById(Integer id) {
        return chemicalsRepository.findById(id).orElse(null);
    }

}
