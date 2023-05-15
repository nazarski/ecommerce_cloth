import 'dart:developer';

import 'package:ecommerce_cloth/data/data_sources/remote/addresses_remote_data.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_addresses_repository.dart';

class ManageAddressesRepoImpl implements ManageAddressesRepository {
  @override
  Future<List<UserAddressEntity>> getUserAddresses({required String userId}) async {
    try {
      final listAddresses = await AddressesRemoteData.getUserAddresses(userId: userId);
      return listAddresses.map((e) => e.toEntity()).toList();
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }

  @override
  Future<void> postUserAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  }) async {
    try {
      final UserAddressModel entity = UserAddressModel.fromEntity(entity: userAddressEntity);
      await AddressesRemoteData.addUserAddress(addressModel: entity, jwt: jwt, userId: userId);
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<void> updateUserAddress({
    required String userId,
    required String jwt,
    required UserAddressEntity userAddressEntity,
  }) async {
    try {
      final UserAddressModel entity = UserAddressModel.fromEntity(entity: userAddressEntity);
      await AddressesRemoteData.updateUserAddress(addressModel: entity, jwt: jwt, userId: userId);
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  @override
  Future<void> setPrimaryAddress({
    required String userId,
    required String jwt,
    required List<UserAddressEntity> listOfAddresses,
  }) async {
    final List<UserAddressModel> listOfModels = listOfAddresses.map((entity) {
      final UserAddressModel model = UserAddressModel.fromEntity(entity: entity);
      return model;
    }).toList();
    await AddressesRemoteData.setPrimaryAddress(
      jwt: jwt,
      userId: userId,
      listOfAddresses: listOfModels,
    );
  }
}
