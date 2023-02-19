import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

class UserInfoModel {
  final int createdAt;
  final String displayName;
  final String email;
  final List<String> favorites;
  final String photoUrl;

  const UserInfoModel({
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.favorites,
    required this.photoUrl,
  });

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

  UserInfoEntity toEntity() {
    return UserInfoEntity(
      createdAt: createdAt,
      displayName: displayName,
      email: email,
      favorites: favorites,
      photoUrl: photoUrl,
    );
  }

  factory UserInfoModel.fromEntity({required UserInfoEntity entity}) {
    return UserInfoModel(
      createdAt: entity.createdAt,
      displayName: entity.displayName,
      email: entity.email,
      favorites: entity.favorites,
      photoUrl: entity.photoUrl,
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
