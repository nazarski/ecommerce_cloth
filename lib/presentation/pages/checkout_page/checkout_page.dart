import 'package:ecommerce_cloth/core/enums/checkout_status.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/delivery_service_entity/delivery_service_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/checkout_page/widgets/checkout_page_address.dart';
import 'package:ecommerce_cloth/presentation/pages/checkout_page/widgets/delivety_method_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/payment_pages/payments_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/success_page/success_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/snack_bars.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/total_amount.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/checkout_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_order_state/order_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/adresses_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const routeName = 'checkout-page';

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final FocusNode cvvFocusController = FocusNode();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(checkoutProvider, (previous, next) {
      if (previous != next && next == CheckoutStatus.loading) {
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.transparent,
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                ],
              );
            });
      }
      if (previous != next && next == CheckoutStatus.success) {
        ref.read(userCartProvider.notifier).emptyCart();
        ref.invalidate(orderProvider);
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(SuccessPage.routeName, (route) => false);
      }
      if (previous != next && next == CheckoutStatus.errorPay) {
        Navigator.of(context).pop();
        topSnackBar(context: context, label: 'Payment error');
        Navigator.of(context).pop();
      }
      if (previous != next && next == CheckoutStatus.errorPlace) {
        topSnackBar(
            context: context, label: 'Server error occurred, try again later');
      }
    });

    return Scaffold(
      appBar: const AppBarSearchBack(
        title: '',
        search: false,
        elevation: true,
        back: true,
        canPop: true,
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
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                final summary = ref.watch(orderProvider).summary;
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
                final ifDeliverySelected =
                    ref.watch(orderProvider).deliveryMethod.price > 0;
                final defaultCard =
                    ref.watch(bankCardsProvider).value?.firstOrNull;
                final defaultAddress =
                    ref.watch(getAllUserAddressesProvider).value?.firstOrNull;
                return ElevatedButton(
                    onPressed: ifDeliverySelected &&
                            defaultCard != null &&
                            defaultAddress != null
                        ? () async {
                            ref
                                .read(orderProvider.notifier)
                                .setAddress(defaultAddress);
                            ref
                                .read(orderProvider.notifier)
                                .setCard(defaultCard);
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
                                          defaultCard.cardIcon,
                                          width: 53,
                                          height: 30,
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                            '**** **** **** ${defaultCard.cardId}')
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
                                        validation: (cvv) {
                                          return validateCvv(cvv);
                                        },
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (cvvController.text.length == 3) {
                                            final order =
                                                ref.read(orderProvider);
                                            ref
                                                .read(checkoutProvider.notifier)
                                                .placeOrder(order: order);
                                          } else {
                                            topSnackBar(
                                                context: context,
                                                label: 'Enter correct cvv');
                                          }
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
