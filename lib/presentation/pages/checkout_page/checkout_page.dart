import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/checkout_page/widgets/checkout_page_address.dart';
import 'package:ecommerce_cloth/presentation/pages/checkout_page/widgets/delivety_method_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/payment_pages/payments_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/snack_bars.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/total_amount.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const routeName = 'checkout-page';



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FocusNode cvvFocusController = FocusNode();
    final TextEditingController cvvController = TextEditingController();
    CardEntity card = const CardEntity();
    int amount = 0;
    return Scaffold(
      appBar: const AppBarSearchBack(
        title: '',
        search: false,
        elevation: true,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const CheckoutPageAddress(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(PaymentsNestPage.routeName);
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
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(builder: (context, ref, child) {
              final defaultCard = ref.watch(bankCardsProvider);
              return defaultCard.when(data: (data) {
                if (data.isEmpty) {
                  return const SizedBox(
                    height: 64,
                    child: Center(
                      child: Text(
                        'No card found',
                      ),
                    ),
                  );
                }
                final defaultCard = data.first;
                card = data.first;
                return SizedBox(
                  height: 64,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                              )
                            ]),
                        child: SvgPicture.asset(
                          defaultCard.cardIcon,
                          width: 53,
                          height: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text('**** **** **** ${defaultCard.cardId}')
                    ],
                  ),
                );
              }, error: (error, stackTrace) {
                return const SizedBox(
                  height: 64,
                  child: Center(
                    child: Text(
                      'An Error occured',
                    ),
                  ),
                );
              }, loading: () {
                return const SizedBox(
                  height: 64,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              });
            }),
            const Spacer(),
            Text(
              'Delivery method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/dhl.svg',
                      estimated: '2-3 days',
                      price: 10,
                      id: '1'),
                ),
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/fedex.svg',
                      estimated: '2-3 days',
                      price: 15,
                      id: '2'),
                ),
                DeliveryMethodWidget(
                  deliveryServiceEntity: DeliveryServiceEntity(
                      icon: 'assets/icons/usps.svg',
                      estimated: '2-3 days',
                      price: 5,
                      id: '3'),
                ),
              ],
            ),
            const Spacer(),
            const TotalAmount(title: 'Order:'),
            const SizedBox(
              height: 12,
            ),
            Consumer(
              builder: (context, ref, child) {
                final order = ref.watch(orderProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${order.deliveryMethod.price}\$',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Consumer(
              builder: (context, ref, child) {
                final order = ref.watch(orderProvider);
                final int summary = order.promoCode != null
                    ? (order.totalAmount *
                                (1 - order.promoCode!.discount / 100))
                            .round() +
                        order.deliveryMethod.price
                    : order.deliveryMethod.price + order.totalAmount;
                amount = summary;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Summary:',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$summary\$',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final ifSelected =
                    ref.watch(orderProvider).deliveryMethod.price > 0;

                return ElevatedButton(
                    onPressed: ifSelected
                        ? () async {
                      buildShowModalBottomSheet(
                          context: context,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    card.cardIcon,
                                    width: 53,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 20),
                                  Text('**** **** **** ${card.cardId}')
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFieldValidator(
                                  labelText: 'CVV',
                                  checkOfErrorOnFocusChange: true,
                                  validation: () {},
                                  tempTextEditingController:
                                  cvvController,
                                  focusNode: cvvFocusController,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  passwordVisible: true,
                                  focusPush: cvvFocusController,
                                  readOnly: false,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    cvvController.text.length == 3 ?

                                    ref.read(orderProvider.notifier).liqPayPay(
                                      cardEntity: card,
                                      amount: amount.toDouble(),
                                    ) : topSnackBar(
                                        context: context,
                                        label: 'Enter correct cvv');
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text(
                                          'submit order'.toUpperCase()),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          header: 'Please enter you CVV code');
                          }
                        : () {
                            topSnackBar(
                                context: context,
                                label: 'choose a delivery service');
                          },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text('submit order'.toUpperCase()),
                      ),
                    ));
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
