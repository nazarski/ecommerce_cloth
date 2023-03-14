//
// import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
// import 'package:ecommerce_cloth/presentation/riverpod/new_products_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'product_list_list_item.dart';
//
// class ProductListListView extends ConsumerWidget {
//   const ProductListListView({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final filter = ref.watch(filterValuesProvider.notifier).filter;
//     final list = ref.watch(productListProvider);
//     return list.when(
//       data: (data) => SliverFixedExtentList(
//         delegate: SliverChildBuilderDelegate((context, i) {
//           return ProductListListItem(
//             product: data[i],
//           );
//         }, childCount: data.length),
//         itemExtent: 140,
//       ),
//       error: (error, stackTrace) => SliverFixedExtentList(
//         delegate: SliverChildListDelegate([
//           Text(error.toString()),
//         ]),
//         itemExtent: 140,
//       ),
//       loading: () => SliverFixedExtentList(
//         delegate: SliverChildBuilderDelegate((context, i) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 16.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: const ShimmerWidget(
//                 height: 140,
//               ),
//             ),
//           );
//         }),
//         itemExtent: 140,
//       ),
//     );
//   }
// }
//
//
