abstract class AddressChecker {
  bool check(String address);
}

class AddressCheckerImpl implements AddressChecker {
  @override
  bool check(String address) {
    return address == "tokyo";
  }
}

// 無名クラス（のようなもの）
class AnonymousAddressChecker implements AddressChecker {
  AnonymousAddressChecker({required bool check(String address)})
      : _check = check;

  final bool Function(String) _check;

  @override
  bool check(String address) => _check(address);
}
