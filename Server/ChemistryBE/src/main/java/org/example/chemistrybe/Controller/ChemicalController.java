package org.example.chemistrybe.Controller;

import org.example.chemistrybe.DTO.Element;
import org.example.chemistrybe.Model.Chemical;
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
    public List<Chemical> findAll(){
        return chemicalsService.findAll();
    }
    @GetMapping("/Chemiscals/{name}")
    public Chemical getChemistcalsById(@PathVariable String name){
        return chemicalsService.findByName(name);
    }
    @GetMapping("/Chemiscals/GetAllElements")
    public List<Element> getAllElement(){
        return chemicalsService.getAllElement();
    }
    @GetMapping("/Chemiscals/GetAllElements/{name}")
    public Element getAllElement(@PathVariable String name){
        return chemicalsService.findByNameElement(name);
    }


}
