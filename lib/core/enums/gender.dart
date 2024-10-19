enum Gender {
  male,
  female,
  other;

  static Gender? toGender(String? str) {
    return
        // (str != null)
        //     ? Gender.values.firstWhere((element) => element.name == str)
        //     :
        Gender.male;
  }
}
