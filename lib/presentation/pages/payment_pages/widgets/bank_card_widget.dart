import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_canvas.dart';

class BankCardWidget extends StatelessWidget {
  final bool isActiveCard;
  final CardEntity cardEntity;

  const BankCardWidget({
    super.key,
    required this.isActiveCard,
    required this.cardEntity,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ColorFiltered(
          colorFilter: isActiveCard
              ? const ColorFilter.mode(Colors.white, BlendMode.dstIn)
              : ColorFilter.mode(
                  Colors.white.withOpacity(0.6), BlendMode.dstOut),
          child: Container(
            height: height / 4,
            width: width / 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    blurRadius: 10,
                    spreadRadius: 1),
              ],
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: CustomPaint(
                    size: Size(height / 5.5,
                        (height / 5.8 * 1.029585798816568).toDouble()),
                    painter: TopCanvas(),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: CustomPaint(
                    size: Size(height / 3,
                        (height / 3.5 * 0.3715277777777778).toDouble()),
                    painter: BottomCanvas(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.chip,
                        width: 45,
                      ),
                      Text(
                        '* * * *  * * * *  * * * *  ${cardEntity.cardId}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColorsLight.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Card Holder Name',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                cardEntity.cardName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Expiry Date',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                cardEntity.cardDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.white,
                                ),
                              ),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: SvgPicture.asset(
                              _getCardTypeIcon(
                                  cardEntity.cardNumber.toString()),
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            AnimatedCheckBox(
                isActiveCard: isActiveCard, cardEntity: cardEntity),
            Text(
              'Use as default payment method',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }

  String _getCardTypeIcon(String cardNumber) {
    final RegExp visaRegex = RegExp(r'^4[0-9]{6,}$');
    final RegExp mastercardRegex = RegExp(r'^5[1-5][0-9]{5,}$');
    final RegExp amexRegex = RegExp(r'^3[47][0-9]{5,}$');

    String iconPath = '';

    if (visaRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.visa;
    } else if (mastercardRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.masterCard;
    } else if (amexRegex.hasMatch(cardNumber)) {
      iconPath = AppIcons.americanExpress;
    } else {
      iconPath = AppIcons.defaultCard;
    }

    return iconPath;
  }
}

class AnimatedCheckBox extends ConsumerStatefulWidget {
  const AnimatedCheckBox({
    super.key,
    required this.isActiveCard,
    required this.cardEntity,
  });

  final bool isActiveCard;
  final CardEntity cardEntity;

  @override
  ConsumerState<AnimatedCheckBox> createState() => _AnimatedCheckBoxState();
}

class _AnimatedCheckBoxState extends ConsumerState<AnimatedCheckBox> {
  bool? checked;

  @override
  void initState() {
    checked = widget.isActiveCard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      onChanged: widget.isActiveCard
          ? null
          : (value) {
              setState(() {
                checked = value;
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                ref
                    .read(bankCardsProvider.notifier)
                    .makeToDefault(makeDefault: widget.cardEntity);
                setState(() {
                  checked = widget.isActiveCard;
                });
              });
            },
      fillColor: const MaterialStatePropertyAll(
        AppColorsDark.background,
      ),
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
