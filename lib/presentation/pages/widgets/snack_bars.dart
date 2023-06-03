import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

void topSnackBar({
  required BuildContext context,
  required String label,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    return SmartSnackBars.showTemplatedSnackbar(
      context: context,
      backgroundColor: AppColorsLight.primary,
      animateFrom: AnimateFrom.fromTop,
      title: label,

    );
  });
}


void bottomSnackBar({
  required BuildContext context,
  required String label,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SmartSnackBars.showTemplatedSnackbar(
      context: context,
      backgroundColor: AppColorsLight.primary,
      animateFrom: AnimateFrom.fromBottom,
      title: label,

    );
  });
}
