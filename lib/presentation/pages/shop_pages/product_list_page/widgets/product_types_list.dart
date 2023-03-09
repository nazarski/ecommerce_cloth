import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductTypesList extends ConsumerWidget {
  const ProductTypesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesList = ref.watch(productTypesProvider);
    return typesList.when(
      data: (data) => DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            width: 12,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  data[i],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.surfaceTint),
                ),
              ),
            );
          },
        ),
      ),
      error: (_, __) => Text('Error'),
      loading: () => DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            width: 12,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: const ShimmerWidget(
                height: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
