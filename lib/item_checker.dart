import 'dart:io';

abstract class ItemChecker {
  bool check(String item);
}

class ItemCheckerImpl implements ItemChecker {
  @override
  bool check(String item) {
    return 0 < DB.findOr(item, 0);
  }
}

// シングルトン
class DB {
  static DB? _db;
  static var stock = Map<String, int>();

  factory DB() {
    _db ??= DB._();
    return _db!;
  }

  static int findOr(String item, int dflt) {
    sleep(Duration(milliseconds: 1000));
    return stock.containsKey(item) ? stock[item]! : dflt;
  }

  DB._();
}
