import 'dart:async';

import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_shopping_cart_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate =
    Authenticate(AuthRepositoryImpl(), ManageShoppingCartRepositoryImpl());

final logOutProvider = FutureProvider.autoDispose((ref) => _authenticate.logOut());

final authControllerRegistrationProvider =
    StateNotifierProvider.autoDispose<AuthRegisterController, AsyncValue<bool>>(
        (ref) {
  return AuthRegisterController();
});
final authControllerLoginProvider =
    StateNotifierProvider.autoDispose<AuthRegisterController, AsyncValue<bool>>(
        (ref) {
  return AuthRegisterController();
});

class AuthRegisterController extends StateNotifier<AsyncValue<bool>> {
  AuthRegisterController() : super(const AsyncValue.data(false));

  Future<void> signInAnonymously(
    UserCredentialEntity? userCredential,
  ) async {
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

  Future<void> signInAnonymously(
    UserCredentialEntity? userCredential,
  ) async {
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

final userLoggedInProvider = FutureProvider.autoDispose<bool>((ref) async {
  final user = await _authenticate.isExpired();
  if (user!) {
    final userModel = await _authenticate.getUserInfoFromSecureStorage();
    print(userModel);
    await ref
        .read(userInfoProvider.notifier)
        .getUserFromStrapi(jwt: userModel!.jwt, userId: userModel.id);
  }
  return user;
});

class UserFromLocalStateNotifier
    extends StateNotifier<AsyncValue<UserInfoEntity>> {
  UserFromLocalStateNotifier()
      : super(AsyncValue.data(UserInfoEntity as UserInfoEntity));

  Future<void> getUser() async {
    state = (await _authenticate.getUserInfoFromSecureStorage())
        as AsyncValue<UserInfoEntity>;
  }

  FutureOr<void> build() {}
}
