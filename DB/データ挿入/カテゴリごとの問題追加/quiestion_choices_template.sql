-- =====================
-- 問題テンプレ
-- =====================

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'カテゴリ名'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '問題文', '解説'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '?', 1, FALSE FROM q
UNION ALL
SELECT question_id, '?', 2, FALSE FROM q
UNION ALL
SELECT question_id, '?', 3, FALSE FROM q
UNION ALL
SELECT question_id, '?', 4, FALSE FROM q;