import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldBankCard extends StatefulWidget {
  const TextFieldBankCard({
    this.onChanged,
    this.initialValue,
    this.saveButton,
    required this.labelText,
    super.key,
    this.validator,
    this.maxLength,
    required this.checkOfErrorOnFocusChange,
    required this.validation,
    required this.tempTextEditingController,
    required this.focusNode,
    required this.keyboardType,
    required this.autofocus,
    required this.textInputAction,
    required this.inputFormatters,
    required this.passwordVisible,
    required this.focusPush,
    required this.readOnly,
  });

  final String labelText;
  final String? Function(String?)? validator;
  final bool checkOfErrorOnFocusChange;
  final Function validation;
  final TextEditingController tempTextEditingController;
  final FocusNode focusNode;
  final FocusNode focusPush;
  final TextInputType keyboardType;
  final bool autofocus;
  final String? initialValue;
  final int? maxLength;
  final VoidCallback? saveButton;
  final VoidCallback? onChanged;
  final bool readOnly;

  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final bool passwordVisible;

  @override
  State<TextFieldBankCard> createState() => _TextFieldBankCardState();
}

class _TextFieldBankCardState extends State<TextFieldBankCard> {
  bool isError = false;
  String errorString = '';
  Widget _suffixIcons = SvgPicture.asset(AppIcons.bankCard);

  void _onTextChanged(String value) {
    print('vhod');
    if (value.startsWith(RegExp(r'[4]'))) {
      //visa
      setState(() {
        _suffixIcons = SvgPicture.asset(AppIcons.visa);
      });
      return;
    }
    if (value.startsWith(RegExp(r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      setState(() {
        //mastercard
        _suffixIcons = SvgPicture.asset(AppIcons.masterCard);
      });
      return;
    }
    if (value.startsWith(RegExp(r'((34)|(37))'))) {
      setState(() {
        //American Express
        _suffixIcons = SvgPicture.asset(AppIcons.americanExpress);
      });
      return;
    }
  }

  @override
  void initState() {
    widget.tempTextEditingController.addListener(() {
      print('listener');
      if (widget.tempTextEditingController.text.length == 4) {
        print('controller');
        _onTextChanged(widget.tempTextEditingController.text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        FocusScope(
          onFocusChange: (focus) {
            if (!focus) {
              setState(() {
                if (widget.checkOfErrorOnFocusChange &&
                        widget.validation(widget.tempTextEditingController.text).toString().isNotEmpty ||
                    widget.tempTextEditingController.text.isEmpty) {
                  isError = true;

                  errorString = widget.validation(widget.tempTextEditingController.text);
                } else if (widget.tempTextEditingController.text.isNotEmpty) {
                  isError = false;
                  errorString = widget.validation(widget.tempTextEditingController.text);
                }
              });
            }
          },
          child: SizedBox(
            height: height / 13,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColorsLight.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0.5),
                  ),
                ],
                border: isError ? Border.all(color: Colors.red) : null,
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: TextFormField(
                readOnly: widget.readOnly,
                onChanged: (string) {
                  widget.onChanged;
                },
                maxLength: widget.maxLength,
                initialValue: widget.initialValue,
                onFieldSubmitted: (v) {
                  if (widget.textInputAction == TextInputAction.done) {
                    FocusScope.of(context).unfocus();
                  } else {
                    FocusScope.of(context).requestFocus(widget.focusPush);
                  }
                },
                obscureText: widget.passwordVisible,
                focusNode: widget.focusNode,
                controller: widget.tempTextEditingController,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                inputFormatters: widget.inputFormatters,
                validator: (string) {
                  if (widget.validation(widget.tempTextEditingController.text).toString().isNotEmpty) {
                    setState(() {
                      isError = true;
                      errorString = widget.validation(widget.tempTextEditingController.text);
                    });
                    return '';
                  } else {
                    setState(() {
                      isError = false;
                      errorString = widget.validation(widget.tempTextEditingController.text);
                    });
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 40,
                    minHeight: 40,
                    minWidth: 30,
                  ),
                  suffixIcon: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: _suffixIcons,
                  ),
                  errorStyle: const TextStyle(height: 0),
                  labelText: widget.labelText,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isError ? true : false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                child: Text(
                  errorString,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
