import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/features/collections/repositories/collection_repositories.dart';

final collectionRepositoryProvider = Provider((ref) {
  return CollectionRepository();
});
