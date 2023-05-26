import 'package:ecommerce_cloth/core/resources/app_images.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);
  static const routeName = 'success-page';

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                SvgPicture.asset(
                  AppImages.success,
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'Success',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Your order will be delivered soon.\nThank you for choosing our app!',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                            MainPage.routeName, (route) => false);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text('continue shopping'.toUpperCase()),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
