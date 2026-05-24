package feapp.application.usecase;

import java.util.List;

import feapp.application.command.AnswerQuestionCommand;
import feapp.domain.entity.AnswerHistory;
import feapp.domain.entity.Category;
import feapp.domain.entity.Choice;
import feapp.domain.entity.Question;
import feapp.domain.repository.AnswerHistoryRepository;
import feapp.domain.repository.CategoryRepository;
import feapp.domain.repository.ChoiceRepository;
import feapp.domain.repository.QuestionRepository;

public class AnswerQuestionService implements AnswerQuestionUseCase {

    private final CategoryRepository categoryRepository;
    private final QuestionRepository questionRepository;
    private final ChoiceRepository choiceRepository;
    private final AnswerHistoryRepository answerHistoryRepository;

    public AnswerQuestionService(
            CategoryRepository categoryRepository,
            QuestionRepository questionRepository,
            ChoiceRepository choiceRepository,
            AnswerHistoryRepository answerHistoryRepository) {

        this.categoryRepository = categoryRepository;
        this.questionRepository = questionRepository;
        this.choiceRepository = choiceRepository;
        this.answerHistoryRepository = answerHistoryRepository;
    }

    @Override
    public List<Category> findRootCategories() {
        return categoryRepository.findRootCategories();
    }

    @Override
    public List<Category> findChildren(int parentId) {
        return categoryRepository.findChildren(parentId);
    }

    @Override
    public List<Question> findQuestionsByCategoryId(int categoryId) {
        return questionRepository.findByCategoryId(categoryId);
    }

    @Override
    public List<Choice> findChoicesByQuestionId(int questionId) {
        return choiceRepository.findByQuestionId(questionId);
    }

    @Override
    public AnswerQuestionResult answer(AnswerQuestionCommand command) {
        Choice selectedChoice = choiceRepository.findById(command.getSelectedChoiceId())
                .orElseThrow(() -> new IllegalArgumentException("選択肢が見つかりません。"));

        boolean correct = selectedChoice.isCorrect();

        AnswerHistory history = new AnswerHistory(
                command.getUserId(),
                command.getQuestionId(),
                command.getSelectedChoiceId(),
                correct
        );

        answerHistoryRepository.save(history);

        String message = correct ? "正解です！" : "不正解です。";

        return new AnswerQuestionResult(correct, message, "");
    }
}