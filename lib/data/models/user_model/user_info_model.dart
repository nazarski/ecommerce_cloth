
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

class UserInfoModel {
  final DateTime createdAt;
  final String displayName;
  final String email;
  final Iterable favorites;
  final String photoUrl;
  final String jwt;
  final int id;
  final String fullName;
  final String dateOfBirth;
  final bool notification;
  final String fcmToken;

  const UserInfoModel({
    required this.fcmToken,
    required this.notification,
    required this.fullName,
    required this.dateOfBirth,
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
        'fcmToken: $fcmToken,'
        'notification: $notification,'
        'fullName: $fullName,'
        'dateOfBirth: $dateOfBirth,'
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
      fcmToken: fcmToken,
      notification: notification,
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      createdAt: createdAt,
      displayName: displayName,
      email: email,
      favorites: Set<int>.from(favorites),
      photoUrl: photoUrl,
      jwt: jwt,
      id: id,
    );
  }

  factory UserInfoModel.fromEntity({required UserInfoEntity entity}) {
    return UserInfoModel(
      notification: entity.notification,
      fcmToken: entity.fcmToken,
      fullName: entity.fullName,
      dateOfBirth: entity.dateOfBirth,
      jwt: entity.jwt,
      id: entity.id,
      createdAt: entity.createdAt ?? DateTime.now(),
      displayName: entity.displayName,
      email: entity.email,
      favorites: entity.favorites,
      photoUrl: entity.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fcmToken': fcmToken,
      'notification': notification,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'jwt': jwt,
      'id': id,
      'createdAt': createdAt.toString(),
      'displayName': displayName,
      'email': email,
      'favorites': favorites.toList(),
      'photoUrl': photoUrl,
    };
  }

  factory UserInfoModel.fromResponse(Map<String, dynamic> map) {
    return UserInfoModel(
      notification: true,
      fcmToken: '',
      fullName: '',
      jwt: map['jwt'] as String,
      id: map['user']['id'] as int,
      email: map['user']['email'] as String,
      createdAt: DateTime.parse(map['user']['createdAt']),
      displayName: map['user']['username'] as String,
      favorites: const {},
      photoUrl: map['user']['avatarUrl'],
      dateOfBirth: '',
    );
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      dateOfBirth: map['dateOfBirth'] as String,
      fullName: map['fullName'] as String,
      jwt: map['jwt'] as String,
      id: map['id'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      favorites: {},
      photoUrl: map['photoUrl'],
      fcmToken: map['fcmToken'] as String,
      notification: map['notification'] as bool,
    );
  }
}
