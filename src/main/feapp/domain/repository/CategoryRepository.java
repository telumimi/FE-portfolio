package feapp.domain.repository;

import java.util.List;

import feapp.domain.entity.Category;

public interface CategoryRepository {

    List<Category> findRootCategories();

    List<Category> findChildren(int parentId);
}