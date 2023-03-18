import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_page/filter_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/app_bar_back_search.dart';
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
          },
          title: 'Filter',
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: FiltersPage.routeName,
          onGenerateRoute: AppRouter.generateFilterPageNestedRoutes,
        ),
        bottomSheet: Container(
          height: 104,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                  onPressed: () {},
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
