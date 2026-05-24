WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '16進数の小数0.248を10進数の分数で表したものはどれか。', '十進数の数xをn進数に直すには、x = n^0 × A + n^1 × B + n^2 × C...のように分解し、CBAとすれば良い。1未満の十進数の数をn進数に直すには、n^-1 × A + n^-2 × B + n^-3 × C...のように分解し、0.ABC...とする。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '31/32', 1, FALSE FROM q
UNION ALL
SELECT question_id, '31/125', 2, FALSE FROM q
UNION ALL
SELECT question_id, '31/512', 3, FALSE FROM q
UNION ALL
SELECT question_id, '73/512', 4, TRUE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '8ビットの値の全ビットを反転する操作はどれか。', '「ビットを反転する」とは、ビット列のうちの0を1に、1を0にする操作である。このためには排他的論理和を用いる。被演算ビット0と1の排他的論理和は1となり、被演算ビット1と1の排他的論理和は0になる。よって、反転したいビット列と同じビット数の値「1111 1111」の排他的論理和をとれば、前ビットを反転できる。2進数「1111 1111」は16進数で表すと「FF」なので、これとの排他的論理和を取れば良いことがわかる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '16進表記 00 のビット列と排他的論理和をとる。', 1, FALSE FROM q
UNION ALL
SELECT question_id, '16進表記 00 のビット列と論理和をとる。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '16進表記 FF のビット列と排他的論理和をとる。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '16進表記 FF のビット列と論理和をとる。', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '最上位をパリティビットとする8ビット符号において、パリティビット以外の下位7ビットを得るためのビット演算はどれか。', '特定位置のビットを取り出すためには、論理積を用いる。被演算ビット0と1の論理積は0となり、被演算ビット1と1の論理積は1になる。これを利用して、取り出したい位置は1、それ以外の位置は0にしたビット列を作り、論理積をとれば良い。本文で取り出したいのは下位７ビットなので、最上位ビットを0、それ以外を1としたビット列「0111 1111」と元の８ビット符号の論理積をとれば良い。2進数「0111 1111」は16進数で表すと「7F」なのでこれとの論理積をとれば良いことがわかる。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '16進数 0F とのANDをとる。', 1, FALSE FROM q
UNION ALL
SELECT question_id, '16進数 0f とのORをとる。', 2, FALSE FROM q
UNION ALL
SELECT question_id, '16進数 7F とのANDをとる。', 3, TRUE FROM q
UNION ALL
SELECT question_id, '16進数 FF とのXORをとる。', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '10進数の演算式 7÷32 の結果を2進数で表したものはどれか。', '十進数の数xをn進数に直すには、x = n^0 × A + n^1 × B + n^2 × C...のように分解し、CBAとすれば良い。1未満の十進数の数をn進数に直すには、n^-1 × A + n^-2 × B + n^-3 × C...のように分解し、0.ABC...とする。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '0.001011', 1, FALSE FROM q
UNION ALL
SELECT question_id, '0.001101', 2, FALSE FROM q
UNION ALL
SELECT question_id, '0.00111', 3, TRUE FROM q
UNION ALL
SELECT question_id, '0.0111', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, 'ある整数値を、負数を2の補数で表現する2進表記で表すと最下位2ビットは"11"であった。10進表記法の下で、その整数値を4で割った時のあまりに関する記述として、適切なものどれか。ここで、除算の商は、絶対値の小数点以下を切り捨てるものとする。', '補数とはコンピュータの中で負の数を表す方法である。正の数は先頭のビットが0になり、負の数は先頭のビットが1になる。ある数に対する2の補数は、その数の全ビットを反転して、最後に1を足すことで求められる。本文では、「ある整数値」が正の場合と負の場合とであまりの数が異なる可能性を考慮し、この二通りで場合分けする必要がある。¥n【正の場合】¥n3桁目より大きい桁は全て4で割り切れるので、下二桁のみを考えれば良い。下二桁は「11」であるので、10進数に直すと「3」である。よって、正の数だった場合の余りは3である。¥n【負の数】¥n正の数の時と同様に、下二桁についてのみ考えれば良い。2の補数の2の補数をとることによって元の数を得られるので、下二桁は「01」となり、10進数に直すと「−1」である。よって、負の数だった場合の余りは-1である。¥n以上より、最下位2ビットが11である整数値を4で割ったら、その数が正なら余りは3、負なら余りは-1である。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'その整数値が正ならば3', 1, TRUE FROM q
UNION ALL
SELECT question_id, 'その整数値が負ならば-3', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'その整数値が負ならば3', 3, FALSE FROM q
UNION ALL
SELECT question_id, 'その整数値の正負に関わらず0', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '数値を2進数で表すレジスタがある。このレジスタに格納されている正の整数xを10倍する操作はどれか。ここで、桁溢れは起こらないものとする。', '解説'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, 'xを2ビット左にシフトした値にxを加算し、更に1ビット左にシフトする。', 1, TRUE FROM q
UNION ALL
SELECT question_id, 'xを2ビット左にシフトした値にxを加算し、更に2ビット左にシフトする。', 2, FALSE FROM q
UNION ALL
SELECT question_id, 'xを3ビット左にシフトした値と、xを2ビット左にシフトした値を加算する。', 3, FALSE FROM q
UNION ALL
SELECT question_id, 'xを3ビット左にシフトした値にxを加算し、更に1ビット左にシフトする。', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '次に示す手順は、列中の少なくとも一つは1であるビット列が与えられたとき、最も右にある1を残し、他のビット全てを0にするアルゴリズムである。例えば、00101000が与えられたとき、00001000が求まる。aに入る論理演算はどれか。¥n¥n手順1  与えられたビット列Aを符号なしの２進数とみなし、Aから1を引き、結果をBとする。¥n手順2  AとBの排他的論理和を求め、結果をCとする。¥n  AとCの(a)を求め、結果をAとする。', '問題文に与えられたビット列00101000を手順通りに処理し、結果として00001000が求まる論理演算を選ぶ。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '排他的論理和', 1, FALSE FROM q
UNION ALL
SELECT question_id, '否定論理和', 2, FALSE FROM q
UNION ALL
SELECT question_id, '論理積', 3, TRUE FROM q
UNION ALL
SELECT question_id, '論理和', 4, FALSE FROM q;


WITH c AS (
  SELECT category_id
  FROM categories
  WHERE category_name = '離散数学'
),
q AS (
  INSERT INTO questions (category_id, question_text, explanation)
  SELECT category_id, '0以外の数値を浮動小数点表示で表現する場合、仮数部の最上位桁が0以外になるように、桁合わせする操作はどれか。ここで、仮数部の表現方法は、絶対値表現とする。', '仮数部とは、浮動小数点数のうちの有効数字を構成する部分である。'
  FROM c
  RETURNING question_id
)
INSERT INTO choices (question_id, choice_text, choice_order, is_correct)
SELECT question_id, '切り上げ', 1, FALSE FROM q
UNION ALL
SELECT question_id, '切り捨て', 2, FALSE FROM q
UNION ALL
SELECT question_id, '桁上げ', 3, FALSE FROM q
UNION ALL
SELECT question_id, '正規化', 4, TRUE FROM q;