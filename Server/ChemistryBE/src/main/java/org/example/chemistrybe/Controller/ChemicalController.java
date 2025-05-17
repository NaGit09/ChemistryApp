package org.example.chemistrybe.Controller;

import org.example.chemistrybe.Model.Chemicals;
import org.example.chemistrybe.Service.ChemicalsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChemicalController {
    @Autowired
    private ChemicalsService chemicalsService;
    @GetMapping("/Chemiscals")
    public List<Chemicals> findAll(){
        return chemicalsService.findAll();
    }
    @GetMapping("/Chemiscals/{id}")
    public Chemicals getChemistcalsById(@PathVariable Long id){
        return chemicalsService.findById(id);
    }


}
