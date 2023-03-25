import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_user_details_repository.dart';

class ManageUser {
  final ManageUserRepository _manageUserRepository;
  final AuthRepository _authRepository;

  const ManageUser(this._manageUserRepository, this._authRepository);

  Future<void> updateUserInfo({
    required String fullName,
    required String dateOfBirth,
  }) async {
    final UserInfoEntity? userInfoEntity = await _authRepository.getUserFromSecureStorage();
    final updatedUserEntity = UserInfoEntity(
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      jwt: userInfoEntity!.jwt,
      id: userInfoEntity.id,
      createdAt: userInfoEntity.createdAt,
      displayName: userInfoEntity.displayName,
      email: userInfoEntity.displayName,
      favorites: userInfoEntity.favorites,
      photoUrl: userInfoEntity.photoUrl,
    );
    await _manageUserRepository.updateFullNameAndDateOfBirth(userInfoEntity: updatedUserEntity);
    await _authRepository.saveUserToSecureStorage(userModel: updatedUserEntity);
  }

  Future<void> resetPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final UserInfoEntity? userInfoEntity = await _authRepository.getUserFromSecureStorage();
    await _manageUserRepository.resetPassword(
      jwt: userInfoEntity!.jwt,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
