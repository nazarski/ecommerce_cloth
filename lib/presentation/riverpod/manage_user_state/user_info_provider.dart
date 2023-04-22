import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_favourites_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_user_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/notification_repository_impl.dart';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_favourites/manage_favourites.dart';
import 'package:ecommerce_cloth/domain/use_cases/notification_service/notification_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate = Authenticate(AuthRepositoryImpl());

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
    _getUserFromSecureStorage();
  }


  Future<void> _getUserFromSecureStorage() async {
    await _notificationService.enableNotification();
    final userModel = await _authenticate.getUserInfoFromSecureStorage();
    state = userModel!;
  }

  Future<void> getUserFromStrapi({required String jwt, required int userId}) async {
    final userModel = await _authenticate.getUserFromStrapi(jwt: jwt, userId: userId);
    state = userModel!;
  }
  void toggleNotification({required bool notify}) {
    state = state.copyWith(notification: notify);
    print(state.notification);
    print(state);
    _updateUserPermission();
  }

  void addToFavourites(
      {required int systemProductId, required String selectedSize}) {
    final newSet = _favourites.addToFavourites(
      favourites: state.favorites,
      systemProductId: systemProductId,
      size: selectedSize,
      userId: state.id,
      jwt: state.jwt,
    );
    state = state.copyWith(favorites: newSet);
  }
  void removeFromFavourites(
      {required int systemProductId}) {
    final newSet = _favourites.removeFromFavourites(
      favourites: state.favorites,
      systemProductId: systemProductId,
      userId: state.id,
      jwt: state.jwt,
    );
    state = state.copyWith(favorites: newSet);
  }
  Future<void> _updateUserPermission() async {
    await _notificationService.togglePermission(state.notification);
  }
}
