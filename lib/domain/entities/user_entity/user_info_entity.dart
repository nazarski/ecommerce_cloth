import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final String fullName;
  final String dateOfBirth;
  final DateTime? createdAt;
  final String displayName;
  final String email;
  final Set<int> favorites;
  final String photoUrl;
  final String jwt;
  final int id;
  final bool notification;
  final String fcmToken;

  const UserInfoEntity({
    this.notification = true,
    this.fcmToken = '',
    this.fullName = '',
    this.dateOfBirth = '',
    this.jwt = '',
    this.id = 0,
    this.createdAt,
    this.displayName = '',
    this.email = '',
    this.favorites = const {},
    this.photoUrl = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        fcmToken,
        notification,
        dateOfBirth,
        fullName,
        jwt,
        id,
        createdAt,
        displayName,
        email,
        favorites,
        photoUrl,
      ];

  UserInfoEntity copyWith({
    String? fullName,
    String? dateOfBirth,
    DateTime? createdAt,
    String? displayName,
    String? email,
    Set<int>? favorites,
    String? photoUrl,
    String? jwt,
    int? id,
    bool? notification,
    String? fcmToken,
  }) {
    return UserInfoEntity(
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      favorites: favorites ?? this.favorites,
      photoUrl: photoUrl ?? this.photoUrl,
      jwt: jwt ?? this.jwt,
      id: id ?? this.id,
      notification: notification ?? this.notification,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
