import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable{
  final int createdAt;
  final String displayName;
  final String email;
  final List<String> favorites;
  final String photoUrl;

  const UserInfoEntity({
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.favorites,
    required this.photoUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    createdAt,
    displayName,
    email,
    favorites,
    photoUrl,
  ];
}