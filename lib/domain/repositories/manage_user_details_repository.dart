import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';

abstract class ManageUserRepository {
  Future<void> updateFullNameAndDateOfBirth({
    required UserInfoEntity userInfoEntity,
  });

  Future<void> resetPassword({
    required String jwt,
    required String currentPassword,
    required String newPassword,
  });
}
