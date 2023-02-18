class UserInfoModel {
  final int createdAt;
  final String displayName;
  final String email;
  final List<String> favorites;
  final String photoUrl;

//<editor-fold desc="Data Methods">
  const UserInfoModel({
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.favorites,
    required this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoModel &&
          runtimeType == other.runtimeType &&
          createdAt == other.createdAt &&
          displayName == other.displayName &&
          email == other.email &&
          favorites == other.favorites &&
          photoUrl == other.photoUrl);

  @override
  int get hashCode =>
      createdAt.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      favorites.hashCode ^
      photoUrl.hashCode;

  @override
  String toString() {
    return 'UserInfoModel {'
        'createdAt: $createdAt, '
        'displayName: $displayName, '
        'email: $email, '
        'favorites: $favorites, '
        'photoUrl: $photoUrl,'
        '}';
  }

  UserInfoModel copyWith({
    int? createdAt,
    String? displayName,
    String? email,
    List<String>? favorites,
    String? photoUrl,
  }) {
    return UserInfoModel(
      createdAt: createdAt ?? this.createdAt,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      favorites: favorites ?? this.favorites,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'displayName': displayName,
      'email': email,
      'favorites': favorites,
      'photoUrl': photoUrl,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      createdAt: map['createdAt'] as int,
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      favorites: map['favorites'] as List<String>,
      photoUrl: map['photoUrl'] as String,
    );
  }

//</editor-fold>
}
