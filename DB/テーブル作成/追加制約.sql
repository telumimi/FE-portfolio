ALTER TABLE categories
ADD CONSTRAINT unique_category_per_parent
UNIQUE (category_name, parent_category_id);
ALTER TABLE questions
ADD CONSTRAINT unique_question_text UNIQUE (question_text);
ALTER TABLE choices
ADD CONSTRAINT unique_choice_per_question
UNIQUE (question_id, choice_text);


//questionsにexternal_keyを追加
ALTER TABLE questions
ADD COLUMN IF NOT EXISTS external_key varchar(50);

//ユニーク制約を追加
CREATE UNIQUE INDEX IF NOT EXISTS uq_questions_external_key
ON questions (external_key);


//choicesにもユニーク制約を追加
CREATE UNIQUE INDEX IF NOT EXISTS uq_choices_question_order
ON choices (question_id, choice_order);


//現在時刻を保持するカラムを追加
ALTER TABLE answer_histories
ADD COLUMN answered_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
