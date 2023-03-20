import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldValidator extends StatefulWidget {
  const TextFieldValidator({
    this.initialValue,
    required this.labelText,
    super.key,
    this.validator,
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


  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final bool passwordVisible;

  @override
  State<TextFieldValidator> createState() => _TextFieldValidatorState();
}

class _TextFieldValidatorState extends State<TextFieldValidator> {
  bool isError = false;
  Widget? suffixIcon;
  String errorString = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      children: [
        FocusScope(
          onFocusChange: (focus) {
            if (!focus) {
              setState(() {
                if (widget.checkOfErrorOnFocusChange &&
                    widget
                        .validation(widget.tempTextEditingController.text)
                        .toString()
                        .isNotEmpty ||
                    widget.tempTextEditingController.text.isEmpty) {
                  isError = true;
                  suffixIcon = const Icon(Icons.close);
                  errorString = widget.validation(widget.tempTextEditingController.text);
                } else if (widget.tempTextEditingController.text.isNotEmpty) {
                  isError = false;
                  suffixIcon = const Icon(Icons.check);
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
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0.5),
                  ),
                ],
                border: isError ? Border.all(color: Colors.red) : null,
                borderRadius: BorderRadius.circular(4),
                color: AppColorsLight.white,
              ),
              child: TextFormField(
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
                  if (widget
                      .validation(widget.tempTextEditingController.text)
                      .toString()
                      .isNotEmpty) {
                    setState(() {
                      isError = true;
                      errorString = widget.validation(widget.tempTextEditingController.text);
                      suffixIcon = const Icon(Icons.close);
                    });
                    return '';
                  } else {
                    setState(() {
                      isError = false;
                      errorString = widget.validation(widget.tempTextEditingController.text);
                      suffixIcon = const Icon(Icons.check);
                    });
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIconColor:
                  isError ? Theme
                      .of(context)
                      .colorScheme
                      .error : Theme
                      .of(context)
                      .colorScheme
                      .onError,
                  suffixIcon: suffixIcon,
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
