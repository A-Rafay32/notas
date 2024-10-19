import 'package:either_dart/either.dart';
import 'package:notas/core/exceptions/exceptions.dart';

typedef FutureEither0 = Future<Either<Failure, Success>>;
typedef FutureEither1<T> = Future<Either<Failure, T>>;
typedef Either0 = Either<Failure, Success>;
typedef Either1<T> = Either<Failure, T>;

Left<Failure, T> failure<T>(String message) {
  return Left(Failure(message: message));
}

Right<Failure, Success> success(String message) {
  return Right(Success(message: message));
}
