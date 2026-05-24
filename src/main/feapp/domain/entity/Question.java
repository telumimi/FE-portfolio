package feapp.domain.entity;

public class Question {

    private final int id;
    private final int categoryId;
    private final String questionText;
    private final String explanation;

    public Question(int id, int categoryId, String questionText, String explanation) {
        this.id = id;
        this.categoryId = categoryId;
        this.questionText = questionText;
        this.explanation = explanation;
    }

    public int getId() {
        return id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public String getExplanation() {
        return explanation;
    }
}