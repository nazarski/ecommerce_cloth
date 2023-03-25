import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable{
  final String fullName;
  final String dateOfBirth;
  final DateTime createdAt;
  final String displayName;
  final String email;
  final List favorites;
  final String photoUrl;
  final String jwt;
  final int id;

  const UserInfoEntity({
    required this.fullName,
    required this.dateOfBirth,
    required this.jwt,
    required this.id,
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.favorites,
    required this.photoUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
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
}