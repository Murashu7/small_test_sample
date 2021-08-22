# small_test_sample

「小さなユニットテストのすすめ」に載っていたscalaのテストコードをFlutterで実装しました。

参照

「小さなユニットテストのすすめ」

https://zenn.dev/suzuki_hoge/books/2020-12-small-unit-test-65625504e7be1532413f

## 内容

内容が非常にすばらしく、自分で実装してみて非常に勉強になりました。

ポイント

- 一つ一つのモジュール（クラス）をUnitテストでテストする。
- 一つのモジュールがテストする範囲は直接接するレイヤの入出力のみ。
- ライブラリのMockを使わず、自前で実装。
- Mock実装のため無名クラスを利用。Dartでは無名クラスの実装はないので、abstractで無名クラスもどきを作成した。
- DBへの一つのデータ格納が1秒ほどかかる実装で、大きなテストだと約13秒、小さくテストだと約3秒ほどの実行速度となった。

