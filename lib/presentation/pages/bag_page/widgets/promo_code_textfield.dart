import 'package:ecommerce_cloth/presentation/pages/promocodes_page/promocodes_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromoCodeTextField extends ConsumerWidget {
  const PromoCodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promoCode = ref.watch(orderProvider).promoCode;
    return TextField(
      onTap: () {
        buildShowModalBottomSheet(
          context: context,
          child: PromoCodesBodyPage(
            onPromoCodeTap: (promoCode) {
              ref.read(orderProvider.notifier).setPromoCode(promoCode);
            },
          ),
          header: 'Your Promo Codes',
        );
      },
      controller: TextEditingController()..text = promoCode?.promoText ?? '',
      readOnly: true,
      decoration: InputDecoration(
          hintText: 'Enter promo code',
          contentPadding: const EdgeInsets.only(left: 24),
          suffixIcon: MaterialButton(
            shape: const CircleBorder(),
            onPressed: () {
              ref.read(orderProvider.notifier).setPromoCode(null);
            },
            child: const Icon(Icons.close_rounded),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none)),
    );
  }
}
