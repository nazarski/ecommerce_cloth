import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:ecommerce_cloth/presentation/pages/payment_pages/widgets/bank_card_widget.dart';
import 'package:ecommerce_cloth/presentation/pages/payment_pages/widgets/create_new_card_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/animated_card_list.dart';

class PaymentsMethodsPage extends StatefulWidget {
  const PaymentsMethodsPage({Key? key}) : super(key: key);
  static const routeName = 'payments-methods-page';

  @override
  State<PaymentsMethodsPage> createState() => _PaymentsMethodsPageState();
}

class _PaymentsMethodsPageState extends State<PaymentsMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add),
        onPressed: () {
          buildShowModalBottomSheet(context: context, child: const CreateNewCardSheet(), header: 'Add new card');
        },
      ),
      appBar: const AppBarSearchBack(
        title: 'Payment methods',
        search: false,
        elevation: true,
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Your payment cards',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: CardList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardList extends ConsumerWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfCards = ref.watch(bankCardsProvider);
    return listOfCards.when(data: (data) {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return BankCardWidget(
              isActiveCard: index == 0,
              cardEntity: data[index],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: data.length);
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }, loading: () {
      return const ShimmerWidget(
        height: 150,
      );
    });
  }
}
