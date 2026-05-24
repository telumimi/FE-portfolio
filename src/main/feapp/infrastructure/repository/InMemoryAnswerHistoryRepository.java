package feapp.infrastructure.repository;

import java.util.ArrayList;
import java.util.List;

import feapp.domain.entity.AnswerHistory;
import feapp.domain.repository.AnswerHistoryRepository;

public class InMemoryAnswerHistoryRepository implements AnswerHistoryRepository {

    private final List<AnswerHistory> histories = new ArrayList<>();

    @Override
    public void save(AnswerHistory answerHistory) {
        histories.add(answerHistory);
    }

    @Override
    public List<AnswerHistory> findAll() {
        return List.copyOf(histories);
    }
}