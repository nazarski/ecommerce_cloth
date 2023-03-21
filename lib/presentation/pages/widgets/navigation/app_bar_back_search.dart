
import 'package:flutter/material.dart';

class AppBarSearchBack extends StatelessWidget implements PreferredSizeWidget{
  const AppBarSearchBack({
    super.key, required this.title,
  });

  final String? title;
  final bool search;
  final VoidCallback? root;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: root ??
                () {
              Navigator.pop(context);
            },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      title: Text(title ?? ''),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_rounded,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}