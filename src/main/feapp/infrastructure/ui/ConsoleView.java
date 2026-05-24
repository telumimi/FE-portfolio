package feapp.infrastructure.ui;

import java.util.List;
import java.util.Scanner;

import feapp.domain.entity.Category;
import feapp.domain.entity.Choice;
import feapp.domain.entity.Question;

public class ConsoleView {

    private final Scanner scanner = new Scanner(System.in);

    public void showMessage(String message) {
        System.out.println(message);
    }

    public void showError(String message) {
        System.out.println("[エラー] " + message);
    }

    public void showCategories(List<Category> categories) {
        System.out.println();
        System.out.println("カテゴリを選択してください。");

        for (Category category : categories) {
            System.out.println(category.getId() + ": " + category.getName());
        }
    }

    public int inputInt(String label) {
        while (true) {
            System.out.print(label);

            String input = scanner.nextLine();

            try {
                return Integer.parseInt(input);
            } catch (NumberFormatException e) {
                showError("数値を入力してください。");
            }
        }
    }

    public void showQuestion(Question question, List<Choice> choices) {
        System.out.println();
        System.out.println("問題");
        System.out.println(question.getQuestionText());
        System.out.println();

        for (Choice choice : choices) {
            System.out.println(choice.getChoiceOrder() + ": " + choice.getChoiceText());
        }
    }

    public int inputChoiceOrder() {
        return inputInt("回答: ");
    }

    public void showAnswerResult(boolean correct, String explanation) {
        if (correct) {
            System.out.println("正解です！");
        } else {
            System.out.println("不正解です。");
        }

        System.out.println("解説: " + explanation);
    }
}