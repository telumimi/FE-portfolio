package feapp.infrastructure.repository;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import feapp.domain.entity.Choice;
import feapp.domain.repository.ChoiceRepository;

public class InMemoryChoiceRepository implements ChoiceRepository {

    private final List<Choice> choices = new ArrayList<>();

    public InMemoryChoiceRepository() {
        choices.add(new Choice(1, 1, "バブルソート", 1, false));
        choices.add(new Choice(2, 1, "二分探索", 2, true));
        choices.add(new Choice(3, 1, "クイックソート", 3, false));
        choices.add(new Choice(4, 1, "挿入ソート", 4, false));

        choices.add(new Choice(5, 2, "ER図", 1, false));
        choices.add(new Choice(6, 2, "PERT図", 2, true));
        choices.add(new Choice(7, 2, "DFD", 3, false));
        choices.add(new Choice(8, 2, "状態遷移図", 4, false));
    }

    @Override
    public List<Choice> findByQuestionId(int questionId) {
        return choices.stream()
                .filter(choice -> choice.getQuestionId() == questionId)
                .sorted(Comparator.comparingInt(Choice::getChoiceOrder))
                .toList();
    }

    @Override
    public Optional<Choice> findById(int choiceId) {
        return choices.stream()
                .filter(choice -> choice.getId() == choiceId)
                .findFirst();
    }
}