import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final switchValue = ref.watch(userInfoProvider).notification;
    return Transform.scale(
      scale: .8,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: switchValue
                  ? Theme.of(context).colorScheme.onError.withOpacity(0.2)
                  : Colors.white54.withOpacity(0.2),
              spreadRadius: 0.4,
              blurRadius: 10,
              offset: switchValue ? const Offset(10, 1) : const Offset(-10, 1),
            )
          ],
        ),
        child: CupertinoSwitch(
          activeColor: Colors.grey.withOpacity(0.1),
          value: switchValue,
          thumbColor: switchValue ? Theme.of(context).colorScheme.onError : Theme.of(context).colorScheme.background,
          onChanged: (bool changed) {
            ref.watch(userInfoProvider.notifier).toggleNotification(notify: changed);
          },
        ),
      ),
    );
  }
}
