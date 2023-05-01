import 'package:ecommerce_cloth/presentation/pages/promocodes_page/widgets/promocode_item.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_promocodes_state/get_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromoCodesBodyPage extends ConsumerWidget {
  const PromoCodesBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfPromocodes = ref.watch(promoCodesProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: listOfPromocodes.when(
            data: (promoCodes) => Column(
                  children: List.generate(promoCodes.length, (index) {
                    final promoCode = promoCodes[index];
                    return PromoCodeItem(
                      title: promoCode.title,
                      subtitle: promoCode.promoText,
                      imageUrl: promoCode.promoImage,
                      daysLeft: promoCode.daysLeft.toString(),
                      buttonApply: false,
                    );
                  }),
                ),
            error: (Object error, StackTrace stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return const CircularProgressIndicator.adaptive();
            }),
      ),
    );
  }
}
