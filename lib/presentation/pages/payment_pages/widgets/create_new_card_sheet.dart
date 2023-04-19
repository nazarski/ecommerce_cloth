import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/core/utils/helpers/card_input_formatter.dart';
import 'package:ecommerce_cloth/core/utils/helpers/card_month_input_formatter.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_bank_card.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewCardSheet extends StatefulWidget {
  const CreateNewCardSheet({Key? key}) : super(key: key);

  @override
  State<CreateNewCardSheet> createState() => _CreateNewCardSheetState();
}

class _CreateNewCardSheetState extends State<CreateNewCardSheet> {
  final FocusNode fullNameFocus = FocusNode();
  final FocusNode bankCardFocus = FocusNode();
  final FocusNode expireDateFocus = FocusNode();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController bankCardController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFieldValidator(
              labelText: 'Name on card',
              checkOfErrorOnFocusChange: true,
              validation: (fullName) {
                return validateFullNameHelper(fullName);
              },
              focusNode: fullNameFocus,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              tempTextEditingController: fullNameController,
              keyboardType: TextInputType.name,
              autofocus: false,
              passwordVisible: false,
              focusPush: bankCardFocus,
              readOnly: false,
            ),
            const SizedBox(height: 20),
            TextFieldBankCard(
              labelText: 'Card number',
              checkOfErrorOnFocusChange: true,
              validation: (card) {
                return valueIsEmpty(card);
              },
              focusNode: bankCardFocus,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              tempTextEditingController: bankCardController,
              keyboardType: TextInputType.number,
              autofocus: false,
              passwordVisible: false,
              focusPush: fullNameFocus,
              readOnly: false,
            ),
            const SizedBox(height: 20),
            TextFieldValidator(
              labelText: 'Expire Date',
              checkOfErrorOnFocusChange: true,
              validation: (date) {
                return valueIsEmpty(date);
              },
              focusNode: expireDateFocus,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
                FilteringTextInputFormatter.digitsOnly,
                CardMonthInputFormatter(),
              ],
              tempTextEditingController: expireDateController,
              keyboardType: TextInputType.name,
              autofocus: false,
              passwordVisible: false,
              focusPush: expireDateFocus,
              readOnly: false,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                    value: _isDefault,
                    onChanged: (value) {
                      setState(() {
                        _isDefault = value!;
                      });
                    }),
                Text(
                  'Set as default payment method',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return ElevatedButton(
                    onPressed: () {
              
                      final String cardNumber = bankCardController.text.replaceAll(' ', '');
                      final String cardId = cardNumber.substring(12);
                      final String cardDate = expireDateController.text;
                      if (validateAndSaveHelper(formKey: formKey)) {
                        ref.read(bankCardsProvider.notifier).addNewCard(
                              newCard: CardEntity(
                                  cardId: cardId,
                                  cardNumber: int.parse(cardNumber),
                                  cardDate: cardDate,
                                  cardName: fullNameController.text,
                                  isDefault: _isDefault),
                            );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('ADD CARD'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
