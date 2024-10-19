// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String street;
  final String houseNum;
  final String city;
  final String country;

  Address({
    required this.city,
    required this.houseNum,
    required this.street,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'houseNum': houseNum,
      'city': city,
      'country': country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String,
      houseNum: map['houseNum'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
