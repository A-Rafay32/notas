import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
final userStorageRef = FirebaseStorage.instance.ref("/userSample/");
// final houseStorageRef = FirebaseStorage.instance.ref("userSample");
