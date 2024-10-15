import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notas/core/exceptions/exceptions.dart';
import 'package:notas/core/utils/gen_random_ids.dart';
import 'package:notas/features/auth/model/user_details.dart';
import 'package:notas/features/auth/repositories/auth_repository.dart';
import 'package:notas/features/auth/model/user.dart';
import 'package:notas/features/auth/repositories/user_repository.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/collections/repositories/collection_repositories.dart';

class SocialAuthService extends AuthRepository {
  Future<Either<Failure, Success>> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //check for exisiting user
      if (googleUser != null) {
        final foundUser =
            await UserRepository().getUserByEmail(googleUser.email);
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // if failed to get any user with this email
        if (foundUser.isLeft) {
          final result = await UserRepository().createUser(
              user: UserModel(
                  id: userCredential.user?.uid ?? "",
                  name: userCredential.user?.displayName ?? "",
                  email: userCredential.user?.email ?? "",
                  password: ""),
              uid: userCredential.user?.uid.toString() ?? "");

          await CollectionRepository().createCollection(
              collection: Collection(
                  id: generateId(),
                  createdBy: userCredential.user?.uid ?? "",
                  name: "Main"));
        }
      }
      return Right(
          Success(message: "User signed in with {credential.signInMethod}"));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> facebookSignIn() async {
    try {
      return Right(
          Success(message: "User signed in with {credential.signInMethod}"));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message.toString()));
    }
  }

  // void googleSignIn() {
  //   try {} catch (e) {
  //     rethrow;
  //   }
  // }

  void twitterSignUp() {
    try {} catch (e) {
      rethrow;
    }
  }

  void twitterSignIn() {
    try {} catch (e) {
      rethrow;
    }
  }
}
