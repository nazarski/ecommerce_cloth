import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_page/filter_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/filter_values_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_products_state/paging_controller_provider.dart';
import 'package:ecommerce_cloth/presentation/riverpod/receive_filter_values_provider.dart';
import 'package:ecommerce_cloth/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNestPage extends ConsumerWidget {
  const FilterNestPage({Key? key}) : super(key: key);
  static const routeName = 'filter-nest-page';
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKey.currentState!.maybePop();
      },
      child: Scaffold(
        appBar: AppBarSearchBack(
          search: false,
          root: () {
            Navigator.of(context, rootNavigator: true).pop();
          }, title: '', elevation: true, back: true,
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: FiltersPage.routeName,
          onGenerateRoute: AppRouter.generateFilterPageNestedRoutes,
        ),
        bottomNavigationBar: const _FilterBottomSheet(),
      ),
    );
  }
}

class _FilterBottomSheet extends ConsumerWidget {
  const _FilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.constrainHeight() * 0.15;
        return Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -3),
                    blurRadius: 10)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Discard'),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final receiver = ref.read(receiveFilterValuesProvider);
                    final filter = ref.read(filterValuesProvider.notifier)
                      ..acceptReceiver(receiver: receiver);
                    ref
                        .read(pagingControllerProvider.notifier)
                        .newFilerValue(filter.filter);
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
