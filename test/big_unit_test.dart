import 'package:flutter_test/flutter_test.dart';
import 'package:small_test_sample/address_checker.dart';
import 'package:small_test_sample/age_checker.dart';
import 'package:small_test_sample/api.dart';
import 'package:small_test_sample/item_checker.dart';
import 'package:small_test_sample/user_checker.dart';

void main() {
  test("big_unit_test", () {
    var api = Api(
      ItemCheckerImpl(),
      UserCheckerImpl(
        AgeCheckerImpl(),
        AddressCheckerImpl(),
      ),
    );

    DB.stock["iPhoneSE"] = 3;
    expect(api.check("iPhoneSE", 20, "tokyo"), "OK");

    DB.stock.clear();
    expect(api.check("iPhoneSE", 20, "tokyo"), "NG ITEM");

    DB.stock["iPhone8"] = 3;
    expect(api.check("iPhoneSE", 20, "tokyo"), "NG ITEM");

    DB.stock["iPhoneSE"] = 3;
    expect(api.check("iPhoneSE", 19, "tokyo"), "NG USER");

    DB.stock["iPhoneSE"] = 3;
    expect(api.check("iPhoneSE", 20, "osaka"), "NG USER");

    DB.stock.clear();
    expect(api.check("iPhoneSE", 19, "tokyo"), "NG ITEM");

    DB.stock["iPhone8"] = 3;
    expect(api.check("iPhoneSE", 19, "tokyo"), "NG ITEM");

    DB.stock.clear();
    expect(api.check("iPhoneSE", 20, "osaka"), "NG ITEM");

    DB.stock["iPhone8"] = 3;
    expect(api.check("iPhoneSE", 20, "osaka"), "NG ITEM");

    DB.stock["iPhoneSE"] = 3;
    expect(api.check("iPhoneSE", 19, "osaka"), "NG USER");

    DB.stock.clear();
    expect(api.check("iPhoneSE", 19, "osaka"), "NG ITEM");

    DB.stock["iPhone8"] = 3;
    expect(api.check("iPhoneSE", 19, "osaka"), "NG ITEM");
  });
}
