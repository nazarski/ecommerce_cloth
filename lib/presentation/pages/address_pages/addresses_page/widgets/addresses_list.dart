import 'package:ecommerce_cloth/presentation/pages/address_pages/addresses_page/widgets/address_item.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/create_address_page/create_address_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/adresses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressesList extends ConsumerWidget {
  const AddressesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfAddresses = ref.watch(getAllUserAddressesProvider);
    return listOfAddresses.when(
      data: (data) {
        return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return AddressItem(
                address: data[index].address,
                city: data[index].city,
                country: data[index].country,
                fullName: data[index].fullName,
                region: data[index].region,
                zipCode: data[index].zipCode,
                primary: data[index].primary,
                model: data[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CreateAddressPage.routeName,
                    arguments: data[index],
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: data.length);
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const ShimmerWidget(
          height: 150,
        );
      },
    );
  }
}
