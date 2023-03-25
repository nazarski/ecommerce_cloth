import 'package:flutter/material.dart';

void topSnackBar({
  required BuildContext context,
  required String label,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 20,
          left: 20,
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(child: Text(label)),
        duration: const Duration(seconds: 4),
      ),
    );
  });
}

void bottomSnackBar({
  required BuildContext context,
  required String label,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(child: Text(label)),
        duration: const Duration(seconds: 4),
      ),
    );
  });
}
