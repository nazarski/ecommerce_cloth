import 'package:ecommerce_cloth/data/data_sources/remote/manage_user_remote_data.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_info_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_user_details_repository.dart';

class ManageUserRepositoryImpl extends ManageUserRepository {
  @override
  Future<void> updateFullNameAndDateOfBirth({
    required UserInfoEntity userInfoEntity,
  }) async {
    try {
      final UserInfoModel userInfoModel = UserInfoModel.fromEntity(entity: userInfoEntity);
      await ManageUserRemoteData.updateFullNameAndDateOfBirth(userInfoModel: userInfoModel);
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<void> resetPassword({
    required String jwt,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
    await ManageUserRemoteData.resetPassword(
      jwt: jwt,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }
}
