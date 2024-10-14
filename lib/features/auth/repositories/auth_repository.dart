import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/auth/model/user_details.dart';
import 'package:notas/features/auth/repositories/user_repository.dart';
import 'package:notas/features/auth/model/user.dart';

class AuthRepository {
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  FutureEither0 signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final result = await UserRepository().getUserByEmail(email);

      if (result.isLeft) {
        return failure("No user exists with the email provided");
      }
      return success("User signed in with $email");
    } on FirebaseAuthException catch (e) {
      return failure(e.message.toString());
    } catch (e, stackTrace) {
      debugPrint('Error: $e\nStack Trace: $stackTrace');
      return success(e.toString());
    }
  }

  FutureEither0 signOut() async {
    try {
      await firebaseAuth.signOut();
      return success("User signed out successfully");
    } on FirebaseAuthException catch (e) {
      return failure(e.message.toString());
    } catch (e, stackTrace) {
      debugPrint('Error: $e\nStack Trace: $stackTrace');
      return success(e.toString());
    }
  }

  FutureEither0 register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final result = await UserRepository().createUser(
          user: UserModel(
            id: currentUser?.uid ?? "",
            name: name,
            email: email,
            password: password,
          ),
          uid: currentUser?.uid ?? "");

      await currentUser?.updateDisplayName(name);

      if (result.isLeft) {
        return failure("User failed to be created in database");
      }

      return success("User created with email: $email");
    } on FirebaseAuthException catch (e) {
      return failure(e.message.toString());
    } catch (e, stackTrace) {
      debugPrint('Error: $e\nStack Trace: $stackTrace');
      return success(e.toString());
    }
  }

  FutureEither0 resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      String returnedEmail = await firebaseAuth.verifyPasswordResetCode(code);
      if (returnedEmail.isNotEmpty) {
        await firebaseAuth.confirmPasswordReset(
            code: code, newPassword: newPassword);
      } else {
        return failure("Reset code failed to verify");
      }
      return success("password reset successfully");
    } catch (e, stackTrace) {
      debugPrint('Error: $e\nStack Trace: $stackTrace');
      return failure(e.toString());
    }
  }

  void forgetPassword() {}

  void updateUser() async {
    try {} catch (e) {
      rethrow;
    }
  }

  void updateEmail() {}

  void updatePassword() {}
}
