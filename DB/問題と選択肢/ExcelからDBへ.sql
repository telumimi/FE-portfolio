1.Excelの原本準備
・questions
external_key, category_name, question_text, explanation
・choices
questions_key, choice_order, choice_text, is_correct

2.TSV形式で書き出し
テキスト（タブ区切り）（*.txt）で書き出し

3.拡張子とファイルの種類を変更
txtファイルを名前を付けて保存から、ファイル名、ファイルの種類（すべてのファイル）、
文字コード（UTF-8）に変更して保存。

4.questionsテーブルにexternal_keyを追加
ALTER TABLE questions
ADD COLUMN IF NOT EXISTS external_key varchar(50);

CREATE UNIQUE INDEX IF NOT EXISTS uq_questions_external_key
ON questions (external_key);

5.choicesの重複防止
CREATE UNIQUE INDEX IF NOT EXISTS uq_choices_question_order
ON choices (question_id, choice_order);

6.既存の問題と選択肢を破棄（破棄する場合のみ）。採番も最初から
DELETE FROM choices;
ALTER TABLE choices
ALTER COLUMN choice_id RESTART WITH 1;

DELETE FROM questions;
ALTER TABLE questions
ALTER COLUMN question_id RESTART WITH 1;

もしくは
TRUNCATE TABLE choices, questions RESTART IDENTITY;

7.TSVファイル取り込み用のテーブルを作成（本番用テーブルに直接取り込みたくないので）
CREATE TABLE IF NOT EXISTS import_questions
(
    external_key varchar(50) PRIMARY KEY,
    category_name varchar(255) NOT NULL,
    question_text text NOT NULL,
    explanation text NOT NULL
);

CREATE TABLE IF NOT EXISTS import_choices
(
    question_key varchar(50) NOT NULL,
    choice_order integer NOT NULL,
    choice_text text NOT NULL,
    is_correct boolean NOT NULL,

    PRIMARY KEY (question_key, choice_order)
);

取り込み用テーブルを空にしたい場合は
TRUNCATE TABLEを用いる

8.pgAdminでtsvを読み込む
取り込み用テーブルで
Import/Exportを選択。
設定は
Filename:question.tsv
Format:csv
Encoding:UTF8
Header:Yes
Delimiter:タブ
Quote:"
こんな感じ。choiceも同様

9.ここから先はデータが正しいかどうかの確認作業。まずはカテゴリ名が正しいかを確認。
SELECT
    iq.external_key,
    iq.category_name
FROM import_questions iq
LEFT JOIN categories c
    ON c.category_name = iq.category_name
WHERE c.category_id IS NULL;

10.choices側に存在しない問題キーがない事を確認
SELECT DISTINCT
    ic.question_key
FROM import_choices ic
LEFT JOIN import_questions iq
    ON iq.external_key = ic.question_key
WHERE iq.external_key IS NULL;

11.選択肢がない問題を確認
SELECT
    iq.external_key
FROM import_questions iq
LEFT JOIN import_choices ic
    ON ic.question_key = iq.external_key
WHERE ic.question_key IS NULL;

12.正解数を確認
SELECT
    question_key,
    COUNT(*) AS choice_count,
    COUNT(*) FILTER (WHERE is_correct) AS correct_count
FROM import_choices
GROUP BY question_key
HAVING COUNT(*) FILTER (WHERE is_correct) <> 1;

13.choice_orderの確認
SELECT
    question_key,
    choice_order,
    COUNT(*)
FROM import_choices
GROUP BY question_key, choice_order
HAVING COUNT(*) > 1;

14.ここまででデータに問題がなければ、questionsテーブルに登録
BEGIN;
INSERT INTO questions
(
    external_key,
    category_id,
    question_text,
    explanation
)
SELECT
    iq.external_key,
    c.category_id,
    iq.question_text,
    iq.explanation
FROM import_questions iq
JOIN categories c
    ON c.category_name = iq.category_name
ON CONFLICT (external_key)
DO UPDATE SET
    category_id = EXCLUDED.category_id,
    question_text = EXCLUDED.question_text,
    explanation = EXCLUDED.explanation;
    

INSERT INTO choices
(
    question_id,
    choice_text,
    choice_order,
    is_correct
)
SELECT
    q.question_id,
    ic.choice_text,
    ic.choice_order,
    ic.is_correct
FROM import_choices ic
JOIN questions q
    ON q.external_key = ic.question_key
ON CONFLICT (question_id, choice_order)
DO UPDATE SET
    choice_text = EXCLUDED.choice_text,
    is_correct = EXCLUDED.is_correct;
    

15.ここまで無事にできていたら
COMMIT;
出来ていなかったら
ROLLBACK;

16.最低限はここまでで終わり！やりたかったら正解数とか選択肢とかをもっと確認してもよい。

17.
