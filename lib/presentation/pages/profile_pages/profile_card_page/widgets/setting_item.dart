import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              subtitle,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
        )
      ],
    );
  }
}
