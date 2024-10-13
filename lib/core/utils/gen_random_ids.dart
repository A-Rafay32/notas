import 'package:uuid/uuid.dart';

String generateId() {
  var uuid = const Uuid();
  return uuid.v4();
}
