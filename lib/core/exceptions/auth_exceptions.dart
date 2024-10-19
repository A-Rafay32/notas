import 'package:notas/core/exceptions/exceptions.dart';

/// Auth
class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
      : super(code: 'email-already-in-use', message: 'Email already in use');
}

class WeakPasswordException extends AppException {
  WeakPasswordException()
      : super(code: 'weak-password', message: 'Password is too weak');
}

class WrongPasswordException extends AppException {
  WrongPasswordException()
      : super(code: 'wrong-password', message: 'Wrong password');
}

class UserNotFoundException extends AppException {
  UserNotFoundException()
      : super(code: 'user-not-found', message: 'User not found');
}

class UserNotSignedInException extends AppException {
  UserNotSignedInException()
      : super(
            code: 'user-not-signed-in',
            message: 'The operation can\'t be completed (not signed in)');
}

// /// Cart
// class CartSyncFailedException extends AppException {
//   CartSyncFailedException()
//       : super('cart-sync-failed',
//             'An error has occurred while updating the shopping cart'.hardcoded);
// }

// /// Checkout
// class PaymentFailureEmptyCartException extends AppException {
//   PaymentFailureEmptyCartException()
//       : super('payment-failure-empty-cart',
//             'Can\'t place an order if the cart is empty'.hardcoded);
// }

// // Products
// class NullProductImageUrlException extends AppException {
//   NullProductImageUrlException()
//       : super('user-not-signed-in',
//             'Can\'t upload a product with a null image'.hardcoded);
// }

// /// Orders
// class ParseOrderFailureException extends AppException {
//   ParseOrderFailureException(this.status)
//       : super('parse-order-failure',
//             'Could not parse order status: $status'.hardcoded);
//   final String status;
// }

// // extension StringHardcoded on String {
// //   String get hardcoded => this;
// // }
