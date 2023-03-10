import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

class UserInfoModel {
  final DateTime createdAt;
  final String displayName;
  final String email;
  final List favorites;
  final String photoUrl;
  final String jwt;
  final int id;

  const UserInfoModel({
    required this.id,
    required this.jwt,
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
        'jwt: $jwt'
        'id: $id'
        'displayName username: $displayName, '
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
      jwt: jwt,
      id: id,
    );
  }

  factory UserInfoModel.fromEntity({required UserInfoEntity entity}) {
    return UserInfoModel(
      jwt: entity.jwt,
      id: entity.id,
      createdAt: entity.createdAt,
      displayName: entity.displayName,
      email: entity.email,
      favorites: entity.favorites,
      photoUrl: entity.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jwt': jwt,
      'id': id,
      'createdAt': createdAt.toString(),
      'displayName': displayName,
      'email': email,
      'favorites': favorites,
      'photoUrl': photoUrl,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      jwt: map['jwt'] as String,
      id: map['id'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      favorites: map['favorites'] as List,
      photoUrl: map['photoUrl'] as String,
    );
  }
}
