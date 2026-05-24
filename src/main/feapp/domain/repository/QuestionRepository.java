package feapp.domain.repository;

import java.util.List;

import feapp.domain.entity.Question;

public interface QuestionRepository {

    List<Question> findByCategoryId(int categoryId);
}