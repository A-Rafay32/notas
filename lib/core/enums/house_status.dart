// ignore: camel_case_types, constant_identifier_names

enum HouseStatus {
  Sale,
  Rent,
  Rented,
  Owned;

  // static HouseStatus toHouseStatus(String str) {
  //   return HouseStatus.values.firstWhere((element) => element.name == str);
  // }

  static HouseStatus toHouseStatus(String str) {
    return HouseStatus.Sale;
  }
}
