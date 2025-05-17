package org.example.chemistrybe.Controller;

import org.example.chemistrybe.Model.Experiment;
import org.example.chemistrybe.Service.ExperimentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExperimentController {
    @Autowired
    private ExperimentService experiment;
    @GetMapping("/Experiment/{id1}/{id2}")
    public Experiment getExperiment(@PathVariable int id1 , @PathVariable int id2){
        return experiment.getExperiment(id1 , id2);
    }

}
