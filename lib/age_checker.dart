abstract class AgeChecker {
  bool check(int age);
}

class AgeCheckerImpl implements AgeChecker {
  @override
  bool check(int age) {
    return 20 <= age;
  }
}
