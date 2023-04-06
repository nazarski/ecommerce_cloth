
import 'package:flutter/material.dart';

class AppBarSearchBack extends StatelessWidget implements PreferredSizeWidget{
  const AppBarSearchBack({
    super.key,
    required this.title,
    required this.search,
    this.root,
    required this.elevation,
    required this.back,
    this.share,
  });

  final String? title;
  final bool search;
  final VoidCallback? root;
  final bool elevation;
  final bool back;
  final Widget? share;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: !elevation ? 0 : 10,
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
        if(search)
        IconButton(
          onPressed: () {},
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