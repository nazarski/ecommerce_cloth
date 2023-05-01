import 'package:flutter/material.dart';

class TabMenuItem extends StatelessWidget {
  const TabMenuItem({
    super.key,
    required this.nameTab,
  });

  final String nameTab;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            nameTab,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
