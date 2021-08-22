abstract class AgeChecker {
  bool check(int age);
}

class AgeCheckerImpl implements AgeChecker {
  @override
  bool check(int age) {
    return 20 <= age;
  }
}

// 無名クラス（のようなもの）
class AnonymousAgeChecker implements AgeChecker {
  AnonymousAgeChecker({required bool check(int age)}) : _check = check;

  final bool Function(int) _check;

  @override
  bool check(int age) => _check(age);
}
