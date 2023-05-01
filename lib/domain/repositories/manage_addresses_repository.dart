import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';

abstract class ManageAddressesRepository {
  Future<List<UserAddressEntity>> getUserAddresses({required String userId});
}
