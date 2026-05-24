WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'プロセッサ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, E'1GHzのクロックで動作するCPUがある。このCPUは、機械語の1命令を平均0.8クロックで実行できることがわかっている。\nこのCPUは1秒間に平均何万命令を実行できるか。', '1GHzのクロックで動作するCPUでは1秒間に10の9乗回のクロックが動作する。\n1命令を平均0.8クロックで実行できるので、10の9乗を0.8で割れば答えが求まる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '125', 1, FALSE FROM q
UNION ALL
SELECT question_id, '250', 2, FALSE FROM q
UNION ALL
SELECT question_id, '80000', 3, FALSE FROM q
UNION ALL
SELECT question_id, '125000', 4, TRUE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'プロセッサ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, E'外部割込みの原因となるものはどれか。', '割り込みとは、入出力装置からの信号や演算結果などの要因により、実行中のプログラムを中断して割込み処理用のプログラムに実行を移すことである。\n割り込みは発生要因によって内部割込みと外部割込みに分類される。\n内部割込みは、ソフトウェアの動作が要因で発生する割り込みのことである。\n外部割込みは、州出力装置などCPU外部のハードウェアが要因で発生する割り込みである。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'ゼロによる除算命令の実行', 1, FALSE FROM q
UNION ALL
SELECT question_id, '存在しない命令コードの実行', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'タイマによる時間経過の通知', 3, TRUE FROM q
UNION ALL
SELECT question_id, 'ページフォールトの発生', 4, FALSE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'プロセッサ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, E'割り込み処理の終了後に割込みによって中断された処理を割り込まれた場所から再開するために、割り込み発生時にプロセッサが保存するものはどれか。', '割り込みとは、入出力装置からの信号や演算結果などの要因により、実行中のプログラムを中断して割込み処理用のプログラムに実行を移すことである。\n割り込み発生時にプロセッサのプログラムカウンタが元の処理のアドレスを記憶するので、割り込み処理の終了後に元の処理に戻れる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'インデックスレジスタ', 1, FALSE FROM q
UNION ALL
SELECT question_id, 'データレジスタ', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'プログラムカウンタ', 3, TRUE FROM q
UNION ALL
SELECT question_id, '命令レジスタ', 4, FALSE FROM q;
