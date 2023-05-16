import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_addresses_repository.dart';

class ManageAddresses {
  final ManageAddressesRepository _addressesRepository;

  ManageAddresses(this._addressesRepository);

  Future<List<UserAddressEntity>> getUserAddresses(
      {required String userId}) async {
    return await _addressesRepository.getUserAddresses(userId: userId);
  }

  Future<void> postAddressUser({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  }) async {
    return await _addressesRepository.postUserAddress(
      userId: userId,
      jwt: jwt,
      userAddressEntity: userAddressEntity,
    );
  }

  Future<void> updateUserAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  }) async {
    return await _addressesRepository.updateUserAddress(
      userId: userId,
      jwt: jwt,
      userAddressEntity: userAddressEntity,
    );
  }

  Future<void> setListToPrimaryAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
    required List<UserAddressEntity> listOfAddresses,
  }) async {
    final List<UserAddressEntity> toggledAddresses =
        listOfAddresses.map((address) {
      if (address.addressId == userAddressEntity.addressId) {
        return address.copyWith(primary: true);
      } else {
        return address.copyWith(primary: false);
      }
    }).toList();
    toggledAddresses.sort((a, b) {
      if (a.primary) {
        return -1;
      } else if (b.primary) {
        return 1;
      } else {
        return 0;
      }
    });
    return await _addressesRepository.setPrimaryAddress(
      userId: userId,
      jwt: jwt,
      listOfAddresses: toggledAddresses,
    );
  }
}
