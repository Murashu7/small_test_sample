abstract class AddressChecker {
  bool check(String address);
}

class AddressCheckerImpl implements AddressChecker {
  @override
  bool check(String address) {
    return address == "tokyo";
  }
}
