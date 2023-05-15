import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';

abstract class ManageAddressesRepository {
  Future<List<UserAddressEntity>> getUserAddresses({required String userId});

  Future<void> postUserAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  });
  Future<void> updateUserAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  });
  Future<void> setPrimaryAddress({
    required String userId,
    required String jwt,
    required List<UserAddressEntity> listOfAddresses,
  });
}
