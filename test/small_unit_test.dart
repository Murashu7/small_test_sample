import 'package:flutter_test/flutter_test.dart';
import 'package:small_test_sample/address_checker.dart';
import 'package:small_test_sample/age_checker.dart';
import 'package:small_test_sample/api.dart';
import 'package:small_test_sample/item_checker.dart';
import 'package:small_test_sample/user_checker.dart';

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

    test("UserCheckTest", () {
      // Mockを用意する
      var ageOk = () {
        return AnonymousAgeChecker(
          check: (int age) => true,
        );
      };
      var ageNg = () {
        return AnonymousAgeChecker(
          check: (int age) => false,
        );
      };
      var addressOk = () {
        return AnonymousAddressChecker(
          check: (String address) => true,
        );
      };
      var addressNg = () {
        return AnonymousAddressChecker(
          check: (String address) => false,
        );
      };

      assert(UserCheckerImpl(ageOk(), addressOk()).check(20, "tokyo"));
      assert(!UserCheckerImpl(ageNg(), addressOk()).check(19, "tokyo"));
      assert(!UserCheckerImpl(ageOk(), addressNg()).check(20, "osaka"));
      assert(!UserCheckerImpl(ageNg(), addressNg()).check(19, "osaka"));
    });

    test("ApiTest", () {
      // Mockを用意する
      var itemOk = () {
        return AnonymousItemChecker(
          check: (String item) => true,
        );
      };
      var itemNg = () {
        return AnonymousItemChecker(
          check: (String item) => false,
        );
      };
      var userOk = () {
        return AnonymousUserChecker(
          check: (int age, String address) => true,
        );
      };
      var userNg = () {
        return AnonymousUserChecker(
          check: (int age, String address) => false,
        );
      };

      expect(Api(itemOk(), userOk()).check("iPhoneSE", 20, "tokyo"), "OK");
      expect(Api(itemNg(), userOk()).check("iPhoneSE", 20, "tokyo"), "NG ITEM");
      expect(Api(itemOk(), userNg()).check("iPhoneSE", 20, "tokyo"), "NG USER");
      expect(Api(itemNg(), userNg()).check("iPhoneSE", 20, "tokyo"), "NG ITEM");
    });
  });
}
