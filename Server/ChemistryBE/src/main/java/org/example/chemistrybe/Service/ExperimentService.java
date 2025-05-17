package org.example.chemistrybe.Service;

import org.example.chemistrybe.Model.Experiment;
import org.example.chemistrybe.Repository.ExperimentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExperimentService {
    @Autowired
    private ExperimentRepository experimentRepository;
    public Experiment getExperiment(int id1 , int id2){
        return experimentRepository.getExperiment(id1 , id2);
    }

}
