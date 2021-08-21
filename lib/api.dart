import 'package:small_test_sample/user_checker.dart';
import 'package:small_test_sample/item_checker.dart';

class Api {
  final ItemChecker itemChecker;
  final UserChecker userChecker;
  Api(this.itemChecker, this.userChecker);

  String check(String item, int age, String address) {
    if (!itemChecker.check(item)) {
      return "NG ITEM";
    } else if (!userChecker.check(age, address)) {
      return "NG USER";
    } else {
      return "OK";
    }
  }
}
