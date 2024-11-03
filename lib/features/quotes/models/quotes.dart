// Quotes Model
class Quote {
  final String id;
  String quotes;
  String author;
  final String userId;
  final List<String> collectionIds;
  final String? userFavouriteId; // Nullable

  Quote({
    required this.id,
    required this.quotes,
    required this.author,
    required this.userId,
    required this.collectionIds,
    this.userFavouriteId,
  });

  // Convert a Quote into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quotes': quotes,
      'author': author,
      'userId': userId,
      'collectionIds': collectionIds,
      'userFavouriteId': userFavouriteId,
    };
  }

  // Create a Quote from a Map
  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      quotes: map['quotes'],
      author: map['author'],
      userId: map['userId'],
      collectionIds: List<String>.from(map['collectionIds']),
      userFavouriteId: map['userFavouriteId'],
    );
  }
}
