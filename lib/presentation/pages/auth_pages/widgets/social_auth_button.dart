import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialAuthButton extends StatelessWidget {

  const SocialAuthButton({Key? key, required this.icon,}) : super(key: key);
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

    required this.label,
    required this.ref,
  }) : super(key: key);
  final String label;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
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
              onTap: () async {
                 typeRegister(ref: ref, type: AuthenticateType.google, context: context);
              },
              child: const SocialAuthButton(
                icon: AppIcons.googleIcon,
              ),
            ),
            SizedBox(width: screenSize.width / 30),
            GestureDetector(
              onTap: () async {
                typeRegister(ref: ref, type: AuthenticateType.facebook, context: context);
              },
              child: const SocialAuthButton(
                icon: AppIcons.facebookIcon,
              ),
            )
          ],
        ),
      ],
    );
  }
  void typeRegister ({required WidgetRef ref, required AuthenticateType type, required BuildContext context}) async {
    await ref.read(authControllerRegistrationProvider.notifier).signInAnonymously( UserCredentialEntity(type: type),
    );
  }
}
