import 'package:ecommerce_cloth/presentation/pages/address_pages/address_nest_page.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/adresses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutPageAddress extends ConsumerWidget {
  const CheckoutPageAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(getAllUserAddressesProvider);
    return address.when(
      data: (data) {
        if (data.isEmpty) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(AddressNestPage.routeName);
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    )
                  ]),
              child: const Center(
                child: Text('No address found, please, add an address'),
              ),
            ),
          );
        }
        final address = data.first;
        return Container(
          padding:
              const EdgeInsets.only(top: 16, left: 24, right: 16, bottom: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address.fullName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(AddressNestPage.routeName);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: const Text(
                      'Change',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${address.address}, ${address.city}, ${address.region}, ${address.country}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Container(
          height: 120,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ]),
          child: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return Container(
          height: 120,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                ),
              ]),
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
