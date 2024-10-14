import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/core/exceptions/exceptions.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/quotes/models/quotes.dart';

class QuotesRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference quotesCollection =
      FirebaseFirestore.instance.collection("quotes");

  // Create a new Quote
  FutureEither0 createQuote({
    required Quote quote,
  }) async {
    try {
      await quotesCollection.doc(quote.id).set(quote.toMap());
      return success("Quote created successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Update Quote details
  FutureEither0 updateQuote({
    required String docId,
    required Map<String, dynamic> updatedFields,
  }) async {
    try {
      DocumentSnapshot quoteDoc = await quotesCollection.doc(docId).get();
      if (!quoteDoc.exists) {
        throw "Quote doesn't exist";
      }

      await quoteDoc.reference.update(updatedFields);
      return Right(Success(message: "Quote Updated"));
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Get a specific Quote by ID
  Future<Quote> getQuote(String documentId) async {
    try {
      DocumentSnapshot quoteDoc = await quotesCollection.doc(documentId).get();
      Map<String, dynamic> quoteMap = quoteDoc.data() as Map<String, dynamic>;
      return Quote.fromMap(quoteMap);
    } on FirebaseException catch (e) {
      throw (e.message.toString());
    }
  }

  // Get Quotes by a specific user
  FutureEither1<List<Quote>> getQuotesByUser(String userId) async {
    try {
      QuerySnapshot quotesDocs =
          await quotesCollection.where("userId", isEqualTo: userId).get();
      if (quotesDocs.docs.isNotEmpty) {
        List<Quote> quotes = quotesDocs.docs.map((doc) {
          return Quote.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
        return Right(quotes);
      } else {
        return failure("No quotes found for this user");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Get Quotes by a specific collection
  FutureEither1<List<Quote>> getQuotesByCollection(String collectionId) async {
    try {
      QuerySnapshot quotesDocs = await quotesCollection
          .where("collectionIds", arrayContains: collectionId)
          .get();
      if (quotesDocs.docs.isNotEmpty) {
        List<Quote> quotes = quotesDocs.docs.map((doc) {
          return Quote.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
        return Right(quotes);
      } else {
        return failure("No quotes found in this collection");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Delete a specific Quote
  FutureEither0 deleteQuote(String documentId) async {
    try {
      await quotesCollection.doc(documentId).delete().onError(
          (error, stackTrace) => throw "Failed to delete quote: $error");
      return Right(Success(message: "Quote deleted successfully"));
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  // Add a quote to a user's favourites
  FutureEither0 addToFavourites({
    required String quoteId,
    required String userFavouriteId,
  }) async {
    try {
      await quotesCollection.doc(quoteId).update({
        "userFavouriteId": userFavouriteId,
      }).catchError((error) => throw error);
      return Right(Success(message: "Added to Favourites"));
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }
}
