enum HouseType {
  Apartment,
  House;

  // static HouseType toHouseType(String str) {
  //   return HouseType.values.firstWhere((element) => element.name == str);
  // }

  static HouseType toHouseType(String str) {
    return HouseType.House;
  }
}
