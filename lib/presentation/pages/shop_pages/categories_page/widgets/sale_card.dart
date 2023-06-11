import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SaleCard extends StatelessWidget {
  const SaleCard({Key? key, required this.attribute}) : super(key: key);
  final String attribute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse('https://www.lamoda.co.uk'));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'summer sale'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Up to 50% off',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
