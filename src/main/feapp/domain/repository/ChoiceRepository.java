package feapp.domain.repository;

import java.util.List;
import java.util.Optional;

import feapp.domain.entity.Choice;

public interface ChoiceRepository {

    List<Choice> findByQuestionId(int questionId);

    Optional<Choice> findById(int choiceId);
}