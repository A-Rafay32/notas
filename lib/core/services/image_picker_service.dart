import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notas/core/exceptions/exceptions.dart';
import 'package:notas/core/utils/types.dart';

class ImageService {
  final Reference storageRef = FirebaseStorage.instance.ref();
  final ImagePicker imgPicker = ImagePicker();
  List<XFile>? pickedFiles;

  FutureEither1<List<dynamic>> uploadImages(String path) async {
    try {
      final urlList = [];
      final pickedFiles = await imgPicker.pickMultiImage();

      for (var file in pickedFiles) {
        var ref = storageRef.child(path);
        await ref.putFile(File(file.path)).catchError((error) => throw error);
        String url = await ref.getDownloadURL();
        urlList.add(url);
      }
      print("Image Upload Successfully");

      return Right(urlList);
    } catch (e, stackTrace) {
      print("Error : $e $stackTrace");
      return Left(Failure(message: "Failed to upload Image $e"));
    }
  }

  FutureEither1<String> uploadImage(Reference storageRef, String path) async {
    try {
      final pickedFile = await imgPicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        var ref = storageRef.child(path);
        await ref
            .putFile(File(pickedFile.path))
            .catchError((error) => throw error);
        String url = await ref.getDownloadURL();
        print("Image Upload Successfully");
        return Right(url);
      } else {
        throw "Null Image Error: Failed to pick the file";
      }
    } catch (e, stackTrace) {
      print("Error : $e $stackTrace");
      return Left(Failure(message: "Failed to upload Image $e"));
    }
  }

  FutureEither1<String> pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await imgPicker.pickImage(source: source);
      if (pickedFile != null) {
        return Right(pickedFile.path);
      } else {
        throw "Null Image Error: Failed to pick the file";
      }
    } catch (e, stackTrace) {
      print("Error : $e $stackTrace");
      return Left(Failure(message: "Failed to pick Image $e"));
    }
  }
}
