package feapp.domain.entity;

public class Choice {

    private final int id;
    private final int questionId;
    private final String choiceText;
    private final int choiceOrder;
    private final boolean correct;

    public Choice(int id, int questionId, String choiceText, int choiceOrder, boolean correct) {
        this.id = id;
        this.questionId = questionId;
        this.choiceText = choiceText;
        this.choiceOrder = choiceOrder;
        this.correct = correct;
    }

    public int getId() {
        return id;
    }

    public int getQuestionId() {
        return questionId;
    }

    public String getChoiceText() {
        return choiceText;
    }

    public int getChoiceOrder() {
        return choiceOrder;
    }

    public boolean isCorrect() {
        return correct;
    }
}