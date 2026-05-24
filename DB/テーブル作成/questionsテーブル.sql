
CREATE TABLE questions (
    question_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id INT NOT NULL,
    question_text TEXT NOT NULL,
    explanation TEXT
);