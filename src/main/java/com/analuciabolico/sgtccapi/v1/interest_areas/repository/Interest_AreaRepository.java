package com.analuciabolico.sgtccapi.v1.interest_areas.repository;

import com.analuciabolico.sgtccapi.v1.interest_areas.model.Interest_Area;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Interest_AreaRepository extends JpaRepository<Interest_Area, Long> {
}