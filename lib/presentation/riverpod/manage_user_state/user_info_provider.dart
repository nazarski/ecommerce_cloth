import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_favourites_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_shopping_cart_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_user_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/notification_repository_impl.dart';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_favourites/manage_favourites.dart';
import 'package:ecommerce_cloth/domain/use_cases/notification_service/notification_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate =
    Authenticate(AuthRepositoryImpl(), ManageShoppingCartRepositoryImpl());

final _notificationService = NotificationService(
  NotificationRepositoryImpl(),
  ManageUserRepositoryImpl(),
  AuthRepositoryImpl(),
);
final _favourites = ManageFavourites(ManageFavouritesRepositoryImpl());

final userInfoProvider =
    StateNotifierProvider<UserInfoProvider, UserInfoEntity>((ref) {
  return UserInfoProvider();
});

class UserInfoProvider extends StateNotifier<UserInfoEntity> {
  UserInfoProvider() : super(const UserInfoEntity()) {
    getUserFromSecureStorage();
  }

  Future<void> getUserFromSecureStorage() async {
    await _notificationService.enableNotification();
    final userModel = await _authenticate.getUserInfoFromSecureStorage();
    state = userModel!;
  }

  Future<void> getUserFromStrapi(
      {required String jwt, required int userId}) async {
    final userModel =
        await _authenticate.getUserFromStrapi(jwt: jwt, userId: userId);
    state = userModel;
  }

  void toggleNotification({required bool notify}) {
    state = state.copyWith(notification: notify);
    debugPrint(state.notification.toString());
    debugPrint(state.toString());
    _updateUserPermission();
  }

  void addToFavourites(
      {required int systemProductId, required String selectedSize}) {
    if (!state.favorites.contains(systemProductId)) {
      final newSet = _favourites.addToFavourites(
        favourites: state.favorites,
        systemProductId: systemProductId,
        size: selectedSize,
        userId: state.id,
        jwt: state.jwt,
      );
      state = state.copyWith(favorites: newSet);
    }
  }

  Future<void> removeFromFavourites({required int systemProductId}) async {
    final newSet = state.favorites..remove(systemProductId);
    state = state.copyWith(favorites: newSet);
    await _favourites.getIdAndRemove(
      userId: state.id,
      systemProductId: systemProductId,
    );
  }

  Future<void> _updateUserPermission() async {
    await _notificationService.togglePermission(state.notification);
  }
}
