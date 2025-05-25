package org.example.chemistrybe.controller;

import org.example.chemistrybe.model.Experiment;
import org.example.chemistrybe.service.ExperimentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Experiment")
public class ExperimentController {
    @Autowired
    private ExperimentService experiment;
    //1) get Experiment by id1 , id2
    @GetMapping("/{id1}/{id2}")
    public Experiment getExperiment(@PathVariable int id1 , @PathVariable int id2){
        return experiment.getExperiment(id1 , id2);
    }

}
