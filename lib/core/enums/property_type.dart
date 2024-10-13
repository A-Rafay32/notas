// ignore: camel_case_types, constant_identifier_names

enum PropertyType {
  Residential,
  Commercial;

  static PropertyType toPropertyType(String str) {
    return PropertyType.values.firstWhere((element) => element.name == str);
  }
}
