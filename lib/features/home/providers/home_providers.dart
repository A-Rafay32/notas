// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:notas/features/home/providers/rental_home_notifier.dart';
// import 'package:notas/features/home/repositories/rental_home_repository.dart';

// final rentalHomeNotifierProvider =
//     StateNotifierProvider<RentalHomeNotifier, AsyncValue>((ref) {
//   final repository = ref.read(rentalHomeRepository);
//   return RentalHomeNotifier(repository: repository);
// });

// final rentalHomeRepository = Provider((ref) {
//   return RentalHomeRepository();
// });

// final rentalHomeStreamProvider = StreamProvider((ref) {
//   final repository = ref.read(rentalHomeRepository);
//   return repository.getAllHouses();
// });

// final availableRentalHomeStreamProvider = StreamProvider((ref) {
//   final repository = ref.read(rentalHomeRepository);
//   return repository.getAllAvailableRentalHouse();
// });
