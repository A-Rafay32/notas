// user = buyer : by default
enum UserType {
  user,
  admin,
  seller;

  static UserType toUserType(String str) {
    return UserType.values.firstWhere((element) => element.name == str);
  }
}
