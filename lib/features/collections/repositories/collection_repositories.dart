import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/core/exceptions/exceptions.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/collections/models/collections.dart';

class CollectionRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("collections");

  // Create a new Collection
  FutureEither0 createCollection({
    required Collection collection,
  }) async {
    try {
      await collectionReference.doc(collection.id).set(collection.toMap());
      return success("Collection created successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Update Collection details
  FutureEither0 updateCollection({
    required String docId,
    required Map<String, dynamic> updatedFields,
  }) async {
    try {
      DocumentSnapshot collectionDoc =
          await collectionReference.doc(docId).get();
      if (!collectionDoc.exists) {
        throw "Collection doesn't exist";
      }

      await collectionDoc.reference.update(updatedFields);
      return Right(Success(message: "Collection Updated"));
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Get a specific Collection by ID
  Future<Collection> getCollection(String documentId) async {
    try {
      DocumentSnapshot collectionDoc =
          await collectionReference.doc(documentId).get();
      Map<String, dynamic> collectionMap =
          collectionDoc.data() as Map<String, dynamic>;
      return Collection.fromMap(collectionMap);
    } on FirebaseException catch (e) {
      throw (e.message.toString());
    }
  }

  // Get Collections created by a specific user
  FutureEither1<List<Collection>> getCollectionsByUser(String userId) async {
    try {
      QuerySnapshot collectionDocs =
          await collectionReference.where("createdBy", isEqualTo: userId).get();
      if (collectionDocs.docs.isNotEmpty) {
        List<Collection> collections = collectionDocs.docs.map((doc) {
          return Collection.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
        return Right(collections);
      } else {
        return failure("No collections found for this user");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Delete a specific Collection
  FutureEither0 deleteCollection(String documentId) async {
    try {
      await collectionReference.doc(documentId).delete().onError(
          (error, stackTrace) => throw "Failed to delete collection: $error");
      return Right(Success(message: "Collection deleted successfully"));
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }
}
