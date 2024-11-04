import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/core/extensions/snackbar_ext.dart';
import 'package:notas/features/quotes/models/quotes.dart';
import 'package:notas/features/quotes/providers/quotes_providers.dart';
import 'package:notas/features/quotes/repositories/quote_repository.dart';

class QuotesNotifier extends StateNotifier<AsyncValue> {
  QuotesNotifier({
    required this.repository,
  }) : super(const AsyncData(null));

  final QuotesRepository repository;

  void addQuote(Quote quote, BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await repository
        .createQuote(quote: quote)
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

  void updateQuote(String docId, Map<String, dynamic> updatedFields,
      BuildContext context) async {
    state = const AsyncValue.loading();
    final result = await repository
        .updateQuote(docId: docId, updatedFields: updatedFields)
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

final quoteNotifier = StateNotifierProvider<QuotesNotifier, AsyncValue>((ref) {
  final repository = ref.watch(quotesRepositoryProvider);
  return QuotesNotifier(repository: repository);
});
