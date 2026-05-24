WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '応用数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'Random(n)は、0以上n未満の整数を一様な確率で返す関数である。整数型の変数A、B及びCに対して次の一連の手続きを実行したとき、Cの値が0になる確率はどれか。', 'Random(10)は0から9の整数を一様に返す。したがってAとBがとりうる値はともに10通りであり、その組み合わせの総数は100通りとなる。\nそしてC=A-B=0となるとき、A=Bが成立する。A=Bがとりうる値は0から9の10通りなので、Cの値が0になる確率は10/100=1/10となる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '1/100', 1, FALSE FROM q
UNION ALL
SELECT question_id, '1/20', 2, FALSE FROM q
UNION ALL
SELECT question_id, '1/10', 3, TRUE FROM q
UNION ALL
SELECT question_id, '1/5', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '応用数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '標準偏差に関する記述のうち、適切なものはどれか。', '標準偏差とは、分散の平方根である。分散は、偏差（平均値と各データの差）を2乗したものの平均値をとることで求められる。標準偏差と分散は、データの散らばり具合の指標となる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'すべてのデータに定数aを加えたものの標準偏差は、元の標準偏差にaを加えたものになる。', 1, FALSE FROM q
UNION ALL
SELECT question_id, 'すべてのデータに定数aを加えたものの標準偏差は、元の標準偏差のa倍になる。', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'すべてのデータを2倍したものの標準偏差は、元の標準偏差の1/2倍になる。', 3, FALSE FROM q
UNION ALL
SELECT question_id, 'すべてのデータを2倍したものの標準偏差は、元の標準偏差の2倍になる。', 4, TRUE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '応用数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '浮動小数点形式で表現された数値の演算結果における丸目誤差の説明はどれか。', '丸め誤差とは、指定された有効桁数で演算結果を表すために、切り捨て、切り上げ、四捨五入などで発生する誤差のことである。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '演算結果がコンピュータの扱える最大値を超えることによって生じる誤差である。', 1, FALSE FROM q
UNION ALL
SELECT question_id, '数表現の桁数に限度があるので、最下位桁より小さい部分について四捨五入や切り上げ、切り捨てを行うことによって生じる誤差である。', 2, TRUE FROM q
UNION ALL
SELECT question_id, '乗除算において、指数部が小さいほうの数値の仮数部の下位部分が失われることによって生じる誤差である。', 3, FALSE FROM q
UNION ALL
SELECT question_id, '絶対値がほぼ等しい数値の加減算において、上位の有効数字が失われることによって生じる誤差である。', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '応用数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '正規分布の説明として、適切なものはどれか。', ''
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '故障確率に用いられ、バスタブのような形状をした連続確率分布のこと。', 1, FALSE FROM q
UNION ALL
SELECT question_id, 'すべての事象の起こる確率が等しい現象を表す確率分布のこと。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '平均値を中心とする左右対称で釣鐘状の連続確率分布のこと。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '離散的に発生し、発生確率は一定である離散確率分布のこと。', 4, FALSE FROM q;
