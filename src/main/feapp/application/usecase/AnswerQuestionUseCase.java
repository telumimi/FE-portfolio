package feapp.application.usecase;

import java.util.List;

import feapp.application.command.AnswerQuestionCommand;
import feapp.domain.entity.Category;
import feapp.domain.entity.Choice;
import feapp.domain.entity.Question;

public interface AnswerQuestionUseCase {

    List<Category> findRootCategories();

    List<Category> findChildren(int parentId);

    List<Question> findQuestionsByCategoryId(int categoryId);

    List<Choice> findChoicesByQuestionId(int questionId);

    AnswerQuestionResult answer(AnswerQuestionCommand command);
}