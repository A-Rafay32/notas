import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/features/auth/repositories/user_repository.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/collections/repositories/collection_repositories.dart';

final collectionRepositoryProvider = Provider((ref) {
  return CollectionRepository();
});

final getCollectionsByUser =
    StreamProvider.family<List<Collection>, String>((ref, userId) {
  return ref.watch(collectionRepositoryProvider).getCollectionsByUser(userId);
});



final getDefaultCollection = FutureProvider((ref) async {
  final userValue = await UserRepository().getUser(currentUser?.uid ?? "");
  return CollectionRepository()
      .getCollection(userValue.defaultCollectionId.toString());
});
