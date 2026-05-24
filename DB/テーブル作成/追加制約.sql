ALTER TABLE categories
ADD CONSTRAINT unique_category_per_parent
UNIQUE (category_name, parent_category_id);
ALTER TABLE questions
ADD CONSTRAINT unique_question_text UNIQUE (question_text);
ALTER TABLE choices
ADD CONSTRAINT unique_choice_per_question
UNIQUE (question_id, choice_text);

