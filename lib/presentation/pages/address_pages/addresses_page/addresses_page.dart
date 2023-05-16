import 'package:ecommerce_cloth/presentation/pages/address_pages/addresses_page/widgets/addresses_list.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/create_address_page/create_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class AddressesPage extends ConsumerWidget {
  const AddressesPage({Key? key}) : super(key: key);
  static const routeName = 'addresses-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(CreateAddressPage.routeName);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Expanded(
              child: AddressesList(),
            ),
          ],
        ),
      ),
    );
  }
}