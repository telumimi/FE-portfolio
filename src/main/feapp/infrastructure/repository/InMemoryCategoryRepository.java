package feapp.infrastructure.repository;

import java.util.ArrayList;
import java.util.List;

import feapp.domain.entity.Category;
import feapp.domain.repository.CategoryRepository;

public class InMemoryCategoryRepository implements CategoryRepository {

    private final List<Category> categories = new ArrayList<>();

    public InMemoryCategoryRepository() {
        categories.add(new Category(1, "テクノロジ系", null));
        categories.add(new Category(2, "基礎理論", 1));
        categories.add(new Category(3, "アルゴリズム", 2));

        categories.add(new Category(4, "マネジメント系", null));
        categories.add(new Category(5, "プロジェクトマネジメント", 4));
    }

    @Override
    public List<Category> findRootCategories() {
        return categories.stream()
                .filter(category -> category.getParentId() == null)
                .toList();
    }

    @Override
    public List<Category> findChildren(int parentId) {
        return categories.stream()
                .filter(category -> category.getParentId() != null)
                .filter(category -> category.getParentId() == parentId)
                .toList();
    }
}