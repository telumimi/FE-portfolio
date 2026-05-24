package feapp.domain.repository;

import java.util.List;

import feapp.domain.entity.AnswerHistory;

public interface AnswerHistoryRepository {

    void save(AnswerHistory answerHistory);

    List<AnswerHistory> findAll();
}