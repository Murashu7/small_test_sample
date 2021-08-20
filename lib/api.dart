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
