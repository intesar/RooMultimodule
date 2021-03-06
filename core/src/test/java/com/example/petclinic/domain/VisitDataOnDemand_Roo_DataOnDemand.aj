// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.petclinic.domain;

import com.example.petclinic.domain.Pet;
import com.example.petclinic.domain.PetDataOnDemand;
import com.example.petclinic.domain.VetDataOnDemand;
import com.example.petclinic.domain.Visit;
import com.example.petclinic.domain.VisitDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect VisitDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VisitDataOnDemand: @Component;
    
    private Random VisitDataOnDemand.rnd = new SecureRandom();
    
    private List<Visit> VisitDataOnDemand.data;
    
    @Autowired
    PetDataOnDemand VisitDataOnDemand.petDataOnDemand;
    
    @Autowired
    VetDataOnDemand VisitDataOnDemand.vetDataOnDemand;
    
    public Visit VisitDataOnDemand.getNewTransientVisit(int index) {
        Visit obj = new Visit();
        setDescription(obj, index);
        setPet(obj, index);
        setVisitDate(obj, index);
        return obj;
    }
    
    public void VisitDataOnDemand.setDescription(Visit obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void VisitDataOnDemand.setPet(Visit obj, int index) {
        Pet pet = petDataOnDemand.getRandomPet();
        obj.setPet(pet);
    }
    
    public void VisitDataOnDemand.setVisitDate(Visit obj, int index) {
        Date visitDate = new Date(new Date().getTime() - 10000000L);
        obj.setVisitDate(visitDate);
    }
    
    public Visit VisitDataOnDemand.getSpecificVisit(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Visit obj = data.get(index);
        Long id = obj.getId();
        return Visit.findVisit(id);
    }
    
    public Visit VisitDataOnDemand.getRandomVisit() {
        init();
        Visit obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Visit.findVisit(id);
    }
    
    public boolean VisitDataOnDemand.modifyVisit(Visit obj) {
        return false;
    }
    
    public void VisitDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Visit.findVisitEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Visit' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Visit>();
        for (int i = 0; i < 10; i++) {
            Visit obj = getNewTransientVisit(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
