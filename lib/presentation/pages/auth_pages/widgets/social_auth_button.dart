import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/temp_admin/sandbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({Key? key, required this.icon}) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SvgPicture.asset(
        icon,
        height: 25,
        width: 25,
      ),
    );
  }
}

class SocialMediaBlock extends ConsumerWidget {
  const SocialMediaBlock({
    Key? key,
    required this.googleAuth,
    required this.facebookAuth,
    required this.label,
  }) : super(key: key);
  final VoidCallback googleAuth;
  final VoidCallback facebookAuth;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final wtch = ref.watch(authControllerProvider);
    print('build');
    return wtch.when(
        data: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: googleAuth,
                      child: const SocialAuthButton(
                        icon: AppIcons.googleIcon,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 30),
                    GestureDetector(
                      onTap: facebookAuth,
                      child: const SocialAuthButton(
                        icon: AppIcons.facebookIcon,
                      ),
                    )
                  ],
                ),
              ],
            ),
        error: (_, __) => Container(),
        loading: () => const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
