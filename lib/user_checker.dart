import 'package:small_test_sample/address_checker.dart';
import 'package:small_test_sample/age_checker.dart';

abstract class UserChecker {
  bool check(int age, String address);
}

class UserCheckerImpl implements UserChecker {
  final AgeChecker ageChecker;
  final AddressChecker addressChecker;
  UserCheckerImpl(this.ageChecker, this.addressChecker);

  @override
  bool check(int age, String address) {
    return ageChecker.check(age) && addressChecker.check(address);
  }
}

// 無名クラス（のようなもの）
class AnonymousUserChecker implements UserChecker {
  AnonymousUserChecker({required bool check(int age, String address)})
      : _check = check;

  final bool Function(int, String) _check;

  @override
  bool check(int age, String address) => _check(age, address);
}
