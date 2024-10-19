import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/features/auth/model/user.dart';
import 'package:notas/features/auth/providers/social_auth_notifier.dart';
import 'package:notas/features/auth/repositories/auth_repository.dart';
import 'package:notas/features/auth/repositories/social_auth_repository.dart';
import 'package:notas/features/auth/repositories/user_repository.dart';
import 'package:notas/features/auth/providers/auth_notifier.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository();
});

final socialAuthRepositoryProvider = Provider((ref) {
  return SocialAuthService();
});

final authNotifier = StateNotifierProvider<AuthNotifier, AsyncValue>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  return AuthNotifier(authService: authService);
});

final socialAuthNotifier =
    StateNotifierProvider<SocialAuthNotifier, AsyncValue>((ref) {
  final service = ref.watch(socialAuthRepositoryProvider);
  return SocialAuthNotifier(socialAuthService: service);
});

final authStreamProvider = StreamProvider.autoDispose((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final currentUserProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final currentUserDocProvider = FutureProvider((ref) async {
  return await ref.read(userRepositoryProvider).getUser(currentUser?.uid ?? '');
});

final userRepositoryProvider = Provider((ref) => UserRepository());

final getUserProvider =
    FutureProvider.family<UserModel, String>((ref, String userID) async {
  return ref.watch(userRepositoryProvider).getUser(userID);
});

// final userDocProvider = Provider<UserModel>((ref) {
//   final authService = ref.read(userServiceProvider);
//   final email = ref.read(currentUserProvider)?.email;
//   authService.getUserByEmail(email.toString());
// });
