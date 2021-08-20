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
  static final _stock = Map<String, int>();

  factory DB() {
    _db ??= DB._();
    return _db!;
  }

  static int findOr(String item, int dflt) {
    return _stock.containsKey(item) ? _stock[item]! : dflt;
  }

  DB._();
}
