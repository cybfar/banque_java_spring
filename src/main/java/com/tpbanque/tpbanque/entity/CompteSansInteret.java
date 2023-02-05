package com.tpbanque.tpbanque.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("SANS_INTERET")
public class CompteSansInteret extends CompteBancaire{
    
    public CompteSansInteret() {
        super();
    }
    
}
