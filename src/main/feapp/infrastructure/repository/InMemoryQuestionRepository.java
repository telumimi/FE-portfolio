package feapp.infrastructure.repository;

import java.util.ArrayList;
import java.util.List;

import feapp.domain.entity.Question;
import feapp.domain.repository.QuestionRepository;

public class InMemoryQuestionRepository implements QuestionRepository {

    private final List<Question> questions = new ArrayList<>();

    public InMemoryQuestionRepository() {
        questions.add(new Question(
                1,
                3,
                "次のうち、探索アルゴリズムに分類されるものはどれか。",
                "二分探索は、整列済みデータに対して中央の値と比較しながら探索範囲を半分にしていく探索アルゴリズムです。"
        ));

        questions.add(new Question(
                2,
                5,
                "プロジェクト管理において、作業の順序関係を表す図として適切なものはどれか。",
                "PERT図は、作業の順序関係や所要時間を表すために使われます。"
        ));
    }

    @Override
    public List<Question> findByCategoryId(int categoryId) {
        return questions.stream()
                .filter(question -> question.getCategoryId() == categoryId)
                .toList();
    }
}