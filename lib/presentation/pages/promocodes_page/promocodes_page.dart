import 'package:ecommerce_cloth/domain/entities/promo_code_entity/promo_code_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/promocodes_page/widgets/promocode_item.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_promocodes_state/get_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromoCodesBodyPage extends ConsumerWidget {
  const PromoCodesBodyPage({
    Key? key,
    this.onPromoCodeTap,
  }) : super(key: key);
  final Function(PromoCodeEntity)? onPromoCodeTap;

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
                    return GestureDetector(
                      onTap: onPromoCodeTap != null
                          ? () {
                              onPromoCodeTap!(promoCodes[index]);
                              Navigator.pop(context);
                            }
                          : null,
                      child: PromoCodeItem(
                        title: promoCode.title,
                        subtitle: promoCode.promoText,
                        imageUrl: promoCode.promoImage,
                        daysLeft: promoCode.daysLeft.toString(),
                        buttonApply: false,
                      ),
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
