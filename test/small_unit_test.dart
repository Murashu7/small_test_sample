import 'package:flutter_test/flutter_test.dart';
import 'package:small_test_sample/address_checker.dart';
import 'package:small_test_sample/age_checker.dart';
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

    test("AgeCheckerTest", () {
      assert(AgeCheckerImpl().check(20));
      assert(!AgeCheckerImpl().check(19));
    });

    test("AddressCheckerTest", () {
      assert(AddressCheckerImpl().check("tokyo"));
      assert(!AddressCheckerImpl().check("osaka"));
    });
  });
}
