import 'package:ecommerce_cloth/data/data_sources/remote/addresses_remote_data.dart';
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
}
