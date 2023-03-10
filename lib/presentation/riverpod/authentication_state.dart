import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate = Authenticate(AuthRepositoryImpl());

// final selectTypeForAuth = FutureProvider.family<AuthenticateType>((ref, type) async {
//   await _authenticate.authenticateByType(type: type);
// });