import 'package:ecommerce_cloth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/manage_user_repository_impl.dart';
import 'package:ecommerce_cloth/data/repositories/notification_repository_impl.dart';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/authenticate/authenticate.dart';
import 'package:ecommerce_cloth/domain/use_cases/notification_service/notification_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final _authenticate = Authenticate(AuthRepositoryImpl());

final _notificationService = NotificationService(
  NotificationRepositoryImpl(),
  ManageUserRepositoryImpl(),
  AuthRepositoryImpl(),
);

final userInfoProvider = StateNotifierProvider<UserInfoProvider, UserInfoEntity>((ref) {
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

  void toggleNotification({required bool notify}) {
    state = state.copyWith(notification: notify);
    print(state.notification);
    print(state);
    _updateUserPermission();
  }

  Future<void> _updateUserPermission() async {
    await _notificationService.togglePermission(state.notification);
  }
}
