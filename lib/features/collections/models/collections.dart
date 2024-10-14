// Collection Model
class Collection {
  final String id;
  final String createdBy;
  final String name;

  Collection({
    required this.id,
    required this.createdBy,
    required this.name,
  });

  // Convert a Collection into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdBy': createdBy,
      'name': name,
    };
  }

  // Create a Collection from a Map
  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'],
      createdBy: map['createdBy'],
      name: map['name'],
    );
  }
}


// UserFavourites Model
class UserFavourite {
  final String id;
  final String userId;

  UserFavourite({
    required this.id,
    required this.userId,
  });

  // Convert a UserFavourite into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
    };
  }

  // Create a UserFavourite from a Map
  factory UserFavourite.fromMap(Map<String, dynamic> map) {
    return UserFavourite(
      id: map['id'],
      userId: map['userId'],
    );
  }
}

// Notes Model
class Note {
  final String id;
  final String note;
  final String userId;
  final List<String> collectionIds;

  Note({
    required this.id,
    required this.note,
    required this.userId,
    required this.collectionIds,
  });

  // Convert a Note into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
      'userId': userId,
      'collectionIds': collectionIds,
    };
  }

  // Create a Note from a Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      note: map['note'],
      userId: map['userId'],
      collectionIds: List<String>.from(map['collectionIds']),
    );
  }
}
