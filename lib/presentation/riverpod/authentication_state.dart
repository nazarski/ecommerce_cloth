
import 'dart:async';


import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate = Authenticate(AuthRepositoryImpl());

final authControllerRegistrationProvider = StateNotifierProvider.autoDispose<AuthRegisterController, AsyncValue<bool>>((ref) {
 return AuthRegisterController();
});
final authControllerLoginProvider = StateNotifierProvider.autoDispose<AuthRegisterController, AsyncValue<bool>>((ref) {
 return AuthRegisterController();
});
class AuthRegisterController extends StateNotifier<AsyncValue<bool>> {
 AuthRegisterController() : super(const AsyncValue.data(false));
 Future<void> signInAnonymously(UserCredentialEntity? userCredential,) async {
  try {
   state = const AsyncValue.loading();
   await _authenticate.authenticateByType(userCredential: userCredential!);
   state = const AsyncData(true);

  } catch (e) {
   state = AsyncError(e, StackTrace.current);
  }
 }

 FutureOr<void> build() {}
}

class AuthLoginController extends StateNotifier<AsyncValue<bool>> {
 AuthLoginController() : super(const AsyncValue.data(false));
 Future<void> signInAnonymously(UserCredentialEntity? userCredential,) async {
  try {
   state = const AsyncValue.loading();
   await _authenticate.authenticateByType(userCredential: userCredential!);
   state = const AsyncData(true);

  } catch (e) {
   state = AsyncError(e, StackTrace.current);
  }
 }

 FutureOr<void> build() {}
}

final userLoggedInProvider = FutureProvider<bool>((ref) async {
 final user = _authenticate.isUserExist();
 return user;
});


