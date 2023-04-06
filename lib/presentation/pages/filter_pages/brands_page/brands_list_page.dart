import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/available_filters_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_filter_state/receive_filter_values_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandsListPage extends ConsumerWidget {
  const BrandsListPage({
    Key? key,
  }) : super(key: key);
  static const routeName = 'brands-list-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(availableBrandsProvider);
    final receiver = ref.watch(receiveFilterValuesProvider);
    return Scaffold(
      appBar: const AppBarSearchBack(
        search: false,
        title: 'Brands',
        elevation: false,
        back: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                ref.read(availableBrandsProvider.notifier).searchBrands(value);
              },
            ),
          ),
          brands.when(
            data: (data) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[i],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Checkbox(
                          value: receiver.brandNames.contains(data[i]),
                          onChanged: (checked) {
                            ref
                                .read(receiveFilterValuesProvider.notifier)
                                .selectBrand(data[i]);
                          },
                        )
                      ],
                    );
                  },
                ),
              );
            },
            error: (e, stackTrace) => const Text('Error'),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}
