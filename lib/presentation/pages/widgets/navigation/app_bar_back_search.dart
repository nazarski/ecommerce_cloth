import 'package:flutter/material.dart';

class AppBarSearchBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchBack({
    super.key,
    required this.title,
    required this.search,
    this.root,
    required this.elevation,
    required this.back,
  });

  final String? title;
  final bool search;
  final VoidCallback? root;
  final bool elevation;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: !elevation ? 0 : 10,
      leading: back
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            )
          : null,
      title: Text(title!),
      centerTitle: true,
      actions: [
        search
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
