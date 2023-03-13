import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:equatable/equatable.dart';

class UserCredentialEntity extends Equatable {
  final String? username;
  final String? password;
  final String? email;
  final AuthenticateType type;

  const UserCredentialEntity({
    this.username,
    this.email,
    this.password,
    required this.type,
  });

  @override
  List<Object?> get props => [
        type,
        username,
        email,
        password,
      ];
}
