import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/features/quotes/models/quotes.dart';
import 'package:notas/features/quotes/repositories/quote_repository.dart';

final quotesRepositoryProvider = Provider((ref) {
  return QuotesRepository();
});

final getQuotesByCollection =
    StreamProvider.family<List<Quote>, String>((ref, collectionId)  {
  return ref.watch(quotesRepositoryProvider).getQuotesByCollection(collectionId);
});
 