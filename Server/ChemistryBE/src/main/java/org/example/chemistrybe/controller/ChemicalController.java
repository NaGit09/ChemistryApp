package org.example.chemistrybe.controller;

import org.example.chemistrybe.dto.Element;
import org.example.chemistrybe.model.Chemical;
import org.example.chemistrybe.service.ChemicalsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Chemiscals")
public class ChemicalController {
    @Autowired
    private ChemicalsService chemicalsService;
    @GetMapping("/")
    public List<Chemical> findAll(){
        return chemicalsService.findAll();
    }
    @GetMapping("/{id}")
    public Chemical getChemistcalsById(@PathVariable int id){return chemicalsService.findById(id);}
    @GetMapping("/{name}")
    public Chemical getChemistcalsById(@PathVariable String name){
        return chemicalsService.findByName(name);
    }
    @GetMapping("/GetAllElements")
    public List<Element> getAllElement(){
        return chemicalsService.getAllElement();
    }
    @GetMapping("/GetAllElements/{name}")
    public Element getAllElement(@PathVariable String name){return chemicalsService.findByNameElement(name);}


}
