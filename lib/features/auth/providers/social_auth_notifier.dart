import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/snackbar_ext.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/auth/repositories/auth_repository.dart';
import 'package:notas/features/auth/repositories/social_auth_repository.dart';

class SocialAuthNotifier extends StateNotifier<AsyncValue> {
  SocialAuthNotifier({
    required this.socialAuthService,
  }) : super(const AsyncValue.data(null));

  final SocialAuthService socialAuthService;

  User? currentUser() => AuthRepository.currentUser;

  Stream<User?> authStateChanges() => socialAuthService.authStateChanges();

  void googleSignIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = const AsyncValue.loading();
    final result = await socialAuthService
        .googleSignIn()
        .whenComplete(() => state = const AsyncValue.data(null));
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      context.showSnackBar(right.message.toString());
    });
  }
}
