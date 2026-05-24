WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '情報・通信・計測・制御の理論'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '機械学習における教師あり学習の説明として、最も適切なものはどれか。', '機械学習の教師あり学習とは、コンピューターにデータとそれに対する正解を与えて、未知のデータに対しても正解を推論できるように学習させることである。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '個々の行動に対しての良しあしを得点として与えることによって、得点が最も多く得られるような方策を学習する。', 1, FALSE FROM q
UNION ALL
SELECT question_id, 'コンピュータ利用者の挙動データを蓄積し、挙動データの出現頻度に従って次の挙動を推論する。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '正解のデータを提示したり、データが誤りであることを指摘したりすることによって、未知のデータに対して正誤を得ることを助ける。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '正解のデータを提示せずに、統計的性質や、ある種の条件によって入力パターンを判定したり、クラスタリングしたりする。', 4, FALSE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '情報・通信・計測・制御の理論'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'AIにおける機械学習の説明として、最も適切なものはどれか。', 'AIによる機械学習とは、コンピュータが大量のデータを用いて学習し、分類や予測を行えるようにする技術である。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '記憶したデータから特定のパターンを見つけ出すなどの、人が自然に行っている学習能力をコンピュータに持たせるための技術。', 1, TRUE FROM q
UNION ALL
SELECT question_id, 'コンピュータ、機械などを使って、生命現象や進化のプロセスを再現するための技術。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '特定の分野の専門知識をコンピュータに入力し、入力された知識を用いてコンピュータが推論する技術。', 3, FALSE FROM q
UNION ALL
SELECT question_id, '人が双方向学習を行うために、Webシステムなどの情報技術を用いて、教材や学習管理能力をコンピュータに持たせるための技術。', 4, FALSE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '情報・通信・計測・制御の理論'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'AIにおけるディープラーニングの特徴はどれか。', 'ディープラーニングとは機械学習の手法の一つである。ディープラーニングの特徴は、人間の神経回路を模倣したシステムであるニューラルネットワークを多層にして用いていることである。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '"AならばBである"というルールを人間があらかじめ設定して、新しい知識を論理式で表現したルールに基づく推論の結果として、解を求めるものである。', 1, FALSE FROM q
UNION ALL
SELECT question_id, '厳密な解でなくてもなるべく正解に近い解を得るようにする方法であり、特定分野に特化せずに、広範囲で汎用的な問題解決ができるようにするものである。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '人間の神経回路を模倣して、認識などの知能を実現する方法であり、ニューラルネットワークを用いて、人間と同じような認識ができるようにするものである。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '判断ルールを作成できる医療診断などの分野に限定されるが、症状から特定の病気に絞り込むといった、確率的に高い判断ができる。', 4, FALSE FROM q;

