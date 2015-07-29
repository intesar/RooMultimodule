// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.example.petclinic.domain;

import com.example.petclinic.domain.Owner;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Owner_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Owner.fieldNames4OrderClauseFilter = java.util.Arrays.asList("pets");
    
    public static long Owner.countOwners() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Owner o", Long.class).getSingleResult();
    }
    
    public static List<Owner> Owner.findAllOwners() {
        return entityManager().createQuery("SELECT o FROM Owner o", Owner.class).getResultList();
    }
    
    public static List<Owner> Owner.findAllOwners(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Owner o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Owner.class).getResultList();
    }
    
    public static Owner Owner.findOwner(Long id) {
        if (id == null) return null;
        return entityManager().find(Owner.class, id);
    }
    
    public static List<Owner> Owner.findOwnerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Owner o", Owner.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Owner> Owner.findOwnerEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Owner o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Owner.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Owner Owner.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Owner merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
