WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'メモリ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'メモリのエラー検出及び訂正にECCを利用している。データバス幅2^nビットに対して冗長ビットがn+2ビット必要な時、128ビットのデータバス幅に必要な冗長ビットは何ビットか。', 'まずnを求める。2^n=128ビットより、n=7である。したがって必要な冗長ビットはn+2=9ビットである。\nちなみに、ECCとは、メモリに記憶されたデータの誤りを検出し、訂正する機能である。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '7', 1, FALSE FROM q
UNION ALL
SELECT question_id, '8', 2, FALSE FROM q
UNION ALL
SELECT question_id, '9', 3, TRUE FROM q
UNION ALL
SELECT question_id, '10', 4, FALSE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'メモリ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'キャッシュメモリに関する記述のうち、適切なものはどれか。', 'CPUは、コンピュータの動作に必要なデータやプログラムを主記憶装置とやり取りするが、主記憶装置はCPUに比べて低速であり、両者の速度差を埋めるために高速なキャッシュメモリが間で一時的にデータを保管する。\nキャッシュメモリと主記憶が整合性をとるためには、キャッシュメモリに書き込んだ内容を主記憶に反映させなければならない。この書き込み方式には「ライトスルー方式」と「ライトバック方式」の2種類がある。\nライトスルー方式では、キャッシュメモリへの書き込みを行うと同時に主記憶にも書き込む。\nライトバック方式では、キャッシュメモリからデータが追い出される際に、そのデータを主記憶に書き込む。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'キャッシュメモリにヒットしない場合に割込みが生じ、プログラムによって主記憶からキャッシュメモリにデータが転送される。', 1, FALSE FROM q
UNION ALL
SELECT question_id, 'キャッシュメモリは、実記憶と仮想記憶のメモリ容量の差を埋めるために採用される。', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'データ書き込み命令を実行したときに、キャッシュメモリと主記憶の両方を書き換える方式と、キャッシュメモリだけを書き換えておき、主記憶の書き換えはキャッシュメモリから当該データが追い出されるときに行う方式とがある。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '半導体メモリのアクセス速度の向上が著しいので、キャッシュメモリの必要性は減っている。', 4, FALSE FROM q;

WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = 'メモリ'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'DRAMの説明として、適切なものはどれか。', 'DRAM(Dynamic Random Access Memory)は、コンデンサに電荷を蓄えることにより情報を記憶し、電源供給がなくなると情報記憶も失われる揮発性メモリである。データの保持のためにリフレッシュ操作が必要である。安価で容量が大きく、主記憶装置に用いられるメモリである。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '1バイト単位でデータの消去及び書き込みが可能な不揮発性のメモリであり、電源遮断時もデータ保持が必要な用途に用いられる', 1, FALSE FROM q
UNION ALL
SELECT question_id, '不揮発性のメモリでNAND型またはNOR型があり、SSDに用いられる。', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'メモリセルはフリップフロップで構成され、キャッシュメモリに用いられる。', 3, FALSE FROM q
UNION ALL
SELECT question_id, 'リフレッシュ動作が必要なメモリであり、PCの主記憶として用いられる。', 4, TRUE FROM q;

