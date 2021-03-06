package com.analuciabolico.sgtccapi.v1.interest_areas.services.implementations;

import com.analuciabolico.sgtccapi.v1.core.models.ResourceCreated;
import com.analuciabolico.sgtccapi.v1.interest_areas.dtos.InterestAreaRequest;
import com.analuciabolico.sgtccapi.v1.interest_areas.model.InterestArea;
import com.analuciabolico.sgtccapi.v1.interest_areas.repository.InterestAreaRepository;
import com.analuciabolico.sgtccapi.v1.interest_areas.services.interfaces.IInterestAreaService;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

import static com.analuciabolico.sgtccapi.v1.core.validations.GenericMessagesValidationEnum.ENTITY_NOT_FOUND;
import static com.analuciabolico.sgtccapi.v1.core.validations.MessageValidationProperties.getMessage;

@Service
@AllArgsConstructor
public class InterestAreaService implements IInterestAreaService {
    private final InterestAreaRepository interestAreaRepository;

    @Override
    public ResourceCreated save(InterestAreaRequest interestAreaRequest) {
        return new ResourceCreated(interestAreaRepository.save(interestAreaRequest.convertToInterestArea()).getId());
    }

    @Override
    public InterestArea findById(Long id) {
        return interestAreaRepository.findById(id).orElseThrow(
                () -> new EntityNotFoundException(getMessage(ENTITY_NOT_FOUND)));
    }

    @Override
    public List<InterestArea> findAll(Sort sort) {
        return interestAreaRepository.findAll(sort);
    }
}
