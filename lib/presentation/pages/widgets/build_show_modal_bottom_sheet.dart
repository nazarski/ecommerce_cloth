import 'package:flutter/material.dart';

Future<dynamic> buildShowModalBottomSheet({
  required BuildContext context,
  required Widget child,
  required String header,
}) {
  return showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              header,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            child
          ],
        ),
      );
    },
  );
}
