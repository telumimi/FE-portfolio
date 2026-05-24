package feapp.domain.entity;

public class AnswerHistory {

    private final int userId;
    private final int questionId;
    private final int selectedChoiceId;
    private final boolean correct;

    public AnswerHistory(int userId, int questionId, int selectedChoiceId, boolean correct) {
        this.userId = userId;
        this.questionId = questionId;
        this.selectedChoiceId = selectedChoiceId;
        this.correct = correct;
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

    public boolean isCorrect() {
        return correct;
    }
}