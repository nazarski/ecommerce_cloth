import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/addresses_page/widgets/address_item.dart';
import 'package:ecommerce_cloth/presentation/pages/address_pages/create_address_page/create_address_page.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);
  static const routeName = 'addresses-page';

  @override
  Widget build(BuildContext context) {
    final List<UserAddressModel> fakeAddresses = [
      const UserAddressModel(
          addressId: '',
          address: '3 Newbridge Court',
          city: 'Chino Hills',
          country: 'United States',
          fullName: 'John Doe',
          primary: false,
          region: 'California',
          zipCode: '91709'),
      const UserAddressModel(
          addressId: '',
          address: 'Nazaleshnosti 23',
          city: 'Brovary',
          country: 'Ukraine',
          fullName: 'Vasylko Vasyl',
          primary: true,
          region: 'Kiev',
          zipCode: '53312'),
    ];
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
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: fakeAddresses.length,
                itemBuilder: (context, index) {
                  return AddressItem(
                    address: fakeAddresses[index].address,
                    city: fakeAddresses[index].city,
                    country: fakeAddresses[index].country,
                    fullName: fakeAddresses[index].fullName,
                    region: fakeAddresses[index].region,
                    zipCode: fakeAddresses[index].zipCode,
                    primary: fakeAddresses[index].primary,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CreateAddressPage.routeName,
                        arguments: fakeAddresses[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
