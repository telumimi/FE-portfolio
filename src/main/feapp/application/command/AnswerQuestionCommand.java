package feapp.application.command;

public class AnswerQuestionCommand {

    private final int userId;
    private final int questionId;
    private final int selectedChoiceId;

    public AnswerQuestionCommand(int userId, int questionId, int selectedChoiceId) {
        this.userId = userId;
        this.questionId = questionId;
        this.selectedChoiceId = selectedChoiceId;
    }

    public int getUserId() {
        return userId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public int getSelectedChoiceId() {
        return selectedChoiceId;
    }
}