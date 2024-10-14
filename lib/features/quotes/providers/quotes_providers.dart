import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/features/quotes/repositories/quote_repository.dart';

final quotesRepositoryProvider = Provider((ref) {
  return QuotesRepository();
});
