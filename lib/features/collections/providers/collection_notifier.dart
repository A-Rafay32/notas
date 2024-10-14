import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/core/extensions/snackbar_ext.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/collections/providers/collection_providers.dart';
import 'package:notas/features/collections/repositories/collection_repositories.dart';
import 'package:notas/features/quotes/models/quotes.dart';
import 'package:notas/features/quotes/providers/quotes_providers.dart';
import 'package:notas/features/quotes/repositories/quote_repository.dart';

class CollectionNotifier extends StateNotifier<AsyncValue> {
  CollectionNotifier({
    required this.repository,
  }) : super(const AsyncData(null));

  final CollectionRepository repository;

  void createCollection(Collection collection, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await repository
        .createCollection(collection: collection)
        .whenComplete(() => const AsyncData(null));
    result.fold(
      (left) {
        print(left.message);
        context.showSnackBar(left.message);
      },
      (right) {
        print(right.message);
        context.showSnackBar(right.message);
      },
    );
  }
}

final collectionNotifier =
    StateNotifierProvider<CollectionNotifier, AsyncValue>((ref) {
  final repository = ref.watch(collectionRepositoryProvider);
  return CollectionNotifier(repository: repository);
});
