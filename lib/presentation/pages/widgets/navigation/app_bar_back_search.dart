import 'package:ecommerce_cloth/presentation/pages/search_page/search_nest_page.dart';
import 'package:flutter/material.dart';

class AppBarSearchBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchBack({
    super.key,
    required this.title,
    required this.search,
    this.root,
    required this.elevation,
    required this.back,
    this.share,
    required this.canPop,
  });

  final String? title;
  final bool search;
  final VoidCallback? root;
  final bool elevation;
  final bool back;
  final Widget? share;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: !elevation ? 0 : 10,
      leading: IconButton(
        onPressed: canPop
            ? root ??
                () {
                  Navigator.of(context).pop();
                }
            : () {},
        icon: back ? const Icon(
          Icons.arrow_back_ios_new_rounded,
        ) : SizedBox(),
      ),
      title: Text(title ?? ''),
      centerTitle: true,
      actions: [
        if (search)
          IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(SearchNestPage.routeName);
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
