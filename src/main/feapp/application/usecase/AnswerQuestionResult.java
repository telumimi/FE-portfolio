package feapp.application.usecase;

public class AnswerQuestionResult {

    private final boolean correct;
    private final String message;
    private final String explanation;

    public AnswerQuestionResult(boolean correct, String message, String explanation) {
        this.correct = correct;
        this.message = message;
        this.explanation = explanation;
    }

    public boolean isCorrect() {
        return correct;
    }

    public String getMessage() {
        return message;
    }

    public String getExplanation() {
        return explanation;
    }
}