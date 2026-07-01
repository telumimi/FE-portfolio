CREATE TABLE user_question_stats
(
    user_question_stat_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    user_id integer NOT NULL,
    question_id integer NOT NULL,

    attempt_count integer NOT NULL DEFAULT 0,
    correct_count integer NOT NULL DEFAULT 0,

    last_answered_at timestamp,
    last_is_correct boolean,

    CONSTRAINT fk_user_question_stats_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_user_question_stats_question
        FOREIGN KEY (question_id)
        REFERENCES questions(question_id)
        ON DELETE CASCADE,

    CONSTRAINT unique_user_question_stats_user_question
        UNIQUE (user_id, question_id),

    CONSTRAINT check_user_question_stats_attempt_count
        CHECK (attempt_count >= 0),

    CONSTRAINT check_user_question_stats_correct_count
        CHECK (correct_count >= 0),

    CONSTRAINT check_user_question_stats_correct_not_over_attempt
        CHECK (correct_count <= attempt_count)
);

CREATE TABLE user_challenge_stats
(
    user_id integer PRIMARY KEY,

    best_correct_streak integer NOT NULL DEFAULT 0,
    total_attempt_count integer NOT NULL DEFAULT 0,
    last_attempted_at timestamp,

    CONSTRAINT fk_user_challenge_stats_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT check_user_challenge_stats_best_correct_streak
        CHECK (best_correct_streak >= 0),

    CONSTRAINT check_user_challenge_stats_total_attempt_count
        CHECK (total_attempt_count >= 0)
);
