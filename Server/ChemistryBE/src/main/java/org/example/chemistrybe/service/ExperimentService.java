package org.example.chemistrybe.service;

import org.example.chemistrybe.model.Experiment;
import org.example.chemistrybe.repository.ExperimentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExperimentService {
    @Autowired
    private ExperimentRepository experimentRepository;
    // 2 ) get Experiment by id1 , id2
    public Experiment getExperiment(int id1 , int id2){
        return experimentRepository.getExperimentRegardlessOfOrder(id1 , id2);
    }

}
