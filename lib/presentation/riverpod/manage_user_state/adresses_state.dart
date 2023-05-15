import 'package:ecommerce_cloth/data/repositories/manage_addresses_repository_impl.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_info_entity.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_addresses/manage_addresses.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ManageAddresses _addresses = ManageAddresses(ManageAddressesRepoImpl());

final getAllUserAddressesProvider =
    StateNotifierProvider<GetAllUserAddressesProvider, AsyncValue<List<UserAddressEntity>>>((ref) {
  final user = ref.read(userInfoProvider);
  return GetAllUserAddressesProvider(user);
});

class GetAllUserAddressesProvider extends StateNotifier<AsyncValue<List<UserAddressEntity>>> {
  GetAllUserAddressesProvider(this.user) : super(const AsyncLoading()) {
    _getAllUserAddresses();
  }

  final UserInfoEntity user;

  Future<void> _getAllUserAddresses() async {
    try {
      final listOfAddresses = await _addresses.getUserAddresses(userId: user.id.toString());
      state = AsyncData(listOfAddresses);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> postUserAddress({
    required UserAddressEntity addressEntity,
  }) async {
    state = const AsyncLoading();
    await _addresses.postAddressUser(
      userId: user.id.toString(),
      jwt: user.jwt,
      userAddressEntity: addressEntity,
    );
    _getAllUserAddresses();
  }

  Future<void> updateUserAddress({
    required UserAddressEntity addressEntity,
  }) async {
    state = const AsyncLoading();
    await _addresses.updateUserAddress(
      userId: user.id.toString(),
      jwt: user.jwt,
      userAddressEntity: addressEntity,
    );
    _getAllUserAddresses();
  }

  Future<void> setPrimaryAddress({
    required UserAddressEntity addressEntity,
  }) async {
    await _addresses.setListToPrimaryAddress(
      userId: user.id.toString(),
      jwt: user.jwt,
      userAddressEntity: addressEntity,
      listOfAddresses: state.value!,
    );
  }
}
