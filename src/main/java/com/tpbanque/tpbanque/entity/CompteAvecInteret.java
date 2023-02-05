package com.tpbanque.tpbanque.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("AVEC_INTERET")
public class CompteAvecInteret extends CompteBancaire{
    
    private float taux;

    public CompteAvecInteret() {
        super();
    }

    public float getTaux() {
        return taux;
    }

    public void setTaux(float taux) {
        this.taux = taux;
    }

    
}
