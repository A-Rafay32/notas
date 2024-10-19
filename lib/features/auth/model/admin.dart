// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:notas/core/enums/user_type.dart';
import 'package:notas/features/auth/model/user_details.dart';

class Admin {
  final UserDetails userDetails;
  final List<String>? permissions;
  final UserType userType;
  final List<String> disapprovedHouses;
  final List<String> featuredHouses;
  final List<String> contracts;

  Admin({
    required this.userDetails,
    this.permissions,
    this.userType = UserType.admin,
    required this.disapprovedHouses,
    required this.featuredHouses,
    required this.contracts,
  });

  Map<String, dynamic> toMap() {
    return {
      'userDetails': userDetails.toMap(),
      'permissions': permissions,
      'userType': userType.toString(),
      'disapprovedHouses': disapprovedHouses,
      'featuredHouses': featuredHouses,
      'contracts': contracts,
    };
  }

  // Convert a map into a Admin object
  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      userDetails: UserDetails.fromMap(map['userDetails']),
      permissions: List<String>.from(map['permissions'] ?? []),
      userType: UserType.toUserType(map['userType']),
      disapprovedHouses: List<String>.from(map['disapprovedHouses']),
      featuredHouses: List<String>.from(map['featuredHouses']),
      contracts: map['contracts'] ?? [],
    );
  }
}
