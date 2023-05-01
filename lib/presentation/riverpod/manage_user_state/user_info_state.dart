import 'dart:async';

import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_shopping_cart_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_user_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_user/manage_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate =
    Authenticate(AuthRepositoryImpl(), ManageShoppingCartRepositoryImpl());

final _manageUser =
    ManageUser(ManageUserRepositoryImpl(), AuthRepositoryImpl());

final getUserInfo = FutureProvider<UserInfoEntity>((ref) async {
  final UserInfoEntity? userInfo =
      await _authenticate.getUserInfoFromSecureStorage();
  return userInfo!;
});

final updateUserProvider =
    StateNotifierProvider.autoDispose<AuthRegisterController, AsyncValue<bool>>(
        (ref) {
  return AuthRegisterController();
});

class AuthRegisterController extends StateNotifier<AsyncValue<bool>> {
  AuthRegisterController() : super(const AsyncValue.data(false));

  Future<void> updateUser(
    String fullName,
    String dateOfBirth,
  ) async {
    try {
      state = const AsyncValue.loading();
      await _manageUser.updateUserInfo(
          fullName: fullName, dateOfBirth: dateOfBirth);
      state = const AsyncData(true);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  FutureOr<void> build() {}
}

final resetPasswordProvider = StateNotifierProvider.autoDispose<
    ResetPasswordController, AsyncValue<bool>>((ref) {
  return ResetPasswordController();
});

class ResetPasswordController extends StateNotifier<AsyncValue<bool>> {
  ResetPasswordController() : super(const AsyncValue.data(false));

  Future<void> resetPassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      state = const AsyncValue.loading();
      await _manageUser.resetPassword(
          currentPassword: currentPassword, newPassword: newPassword);
      state = const AsyncData(true);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  FutureOr<void> build() {}
}
