import 'package:flutter_test/flutter_test.dart';
import 'package:small_test_sample/item_checker.dart';

void main() {
  group("small_unit_test", () {
    test("ItemCheckerTest", () {
      DB.stock = {"iPhoneSE": 3};
      assert(ItemCheckerImpl().check("iPhoneSE"));

      DB.stock = {"iPhone8": 3};
      assert(!ItemCheckerImpl().check("iPhoneSE"));

      DB.stock.clear();
      assert(!ItemCheckerImpl().check("iPhoneSE"));
    });
  });
}
