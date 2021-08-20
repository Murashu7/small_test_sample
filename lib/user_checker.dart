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
