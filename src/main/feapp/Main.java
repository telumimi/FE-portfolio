package feapp;

import feapp.application.usecase.AnswerQuestionService;
import feapp.application.usecase.AnswerQuestionUseCase;
import feapp.domain.repository.AnswerHistoryRepository;
import feapp.domain.repository.CategoryRepository;
import feapp.domain.repository.ChoiceRepository;
import feapp.domain.repository.QuestionRepository;
import feapp.infrastructure.repository.InMemoryAnswerHistoryRepository;
import feapp.infrastructure.repository.InMemoryCategoryRepository;
import feapp.infrastructure.repository.InMemoryChoiceRepository;
import feapp.infrastructure.repository.InMemoryQuestionRepository;
import feapp.infrastructure.ui.ConsoleView;
import feapp.infrastructure.ui.QuestionController;

public class Main {

    public static void main(String[] args) {
        CategoryRepository categoryRepository = new InMemoryCategoryRepository();
        QuestionRepository questionRepository = new InMemoryQuestionRepository();
        ChoiceRepository choiceRepository = new InMemoryChoiceRepository();
        AnswerHistoryRepository answerHistoryRepository = new InMemoryAnswerHistoryRepository();

        AnswerQuestionUseCase answerQuestionUseCase = new AnswerQuestionService(
                categoryRepository,
                questionRepository,
                choiceRepository,
                answerHistoryRepository
        );

        ConsoleView view = new ConsoleView();
        QuestionController controller = new QuestionController(answerQuestionUseCase, view);

        controller.answerQuestion();
    }
}