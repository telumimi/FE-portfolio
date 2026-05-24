package feapp.infrastructure.ui;

import java.util.List;
import java.util.Optional;

import feapp.application.command.AnswerQuestionCommand;
import feapp.application.usecase.AnswerQuestionResult;
import feapp.application.usecase.AnswerQuestionUseCase;
import feapp.domain.entity.Category;
import feapp.domain.entity.Choice;
import feapp.domain.entity.Question;

public class QuestionController {

    private static final int TEMP_USER_ID = 1;

    private final AnswerQuestionUseCase answerQuestionUseCase;
    private final ConsoleView view;

    public QuestionController(AnswerQuestionUseCase answerQuestionUseCase, ConsoleView view) {
        this.answerQuestionUseCase = answerQuestionUseCase;
        this.view = view;
    }

    public void answerQuestion() {
        List<Category> rootCategories = answerQuestionUseCase.findRootCategories();

        if (rootCategories.isEmpty()) {
            view.showError("カテゴリが登録されていません。");
            return;
        }

        int selectedCategoryId = selectCategory(rootCategories);

        while (true) {
            List<Category> children = answerQuestionUseCase.findChildren(selectedCategoryId);

            if (children.isEmpty()) {
                break;
            }

            selectedCategoryId = selectCategory(children);
        }

        List<Question> questions = answerQuestionUseCase.findQuestionsByCategoryId(selectedCategoryId);

        if (questions.isEmpty()) {
            view.showError("このカテゴリには問題が登録されていません。");
            return;
        }

        Question question = questions.get(0);

        List<Choice> choices = answerQuestionUseCase.findChoicesByQuestionId(question.getId());

        if (choices.isEmpty()) {
            view.showError("この問題には選択肢が登録されていません。");
            return;
        }

        view.showQuestion(question, choices);

        Choice selectedChoice = selectChoice(choices);

        AnswerQuestionCommand command = new AnswerQuestionCommand(
                TEMP_USER_ID,
                question.getId(),
                selectedChoice.getId()
        );

        AnswerQuestionResult result = answerQuestionUseCase.answer(command);

        view.showAnswerResult(result.isCorrect(), question.getExplanation());
    }

    private int selectCategory(List<Category> categories) {
        while (true) {
            view.showCategories(categories);
            int selectedId = view.inputInt("カテゴリ番号: ");

            boolean exists = categories.stream()
                    .anyMatch(category -> category.getId() == selectedId);

            if (exists) {
                return selectedId;
            }

            view.showError("表示されているカテゴリ番号を入力してください。");
        }
    }

    private Choice selectChoice(List<Choice> choices) {
        while (true) {
            int selectedOrder = view.inputChoiceOrder();

            Optional<Choice> selectedChoice = choices.stream()
                    .filter(choice -> choice.getChoiceOrder() == selectedOrder)
                    .findFirst();

            if (selectedChoice.isPresent()) {
                return selectedChoice.get();
            }

            view.showError("表示されている選択肢番号を入力してください。");
        }
    }
}