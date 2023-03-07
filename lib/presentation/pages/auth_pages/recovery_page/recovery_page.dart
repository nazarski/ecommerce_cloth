import 'dart:developer';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/widgets/social_auth_button.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({Key? key}) : super(key: key);
  static const routeName = 'recovery_page';

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final FocusNode emailFocus = FocusNode();

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'This field is required and cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Not a valid email address. Should be your@email.com';
    } else {
      return '';
    }
  }

  void validateAndSave() {
    final FormState form = formKey.currentState!;
    if (form.validate()) {
      log('Form is valid');
    } else {
      log('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: height / 10,
              ),
              SizedBox(
                height: height / 60,
              ),
              Text(
                'Please, enter your email address. You will receive a link to create a new password via email.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFieldValidator(
                labelText: 'Email',
                checkOfErrorOnFocusChange: true,
                validation: (email) {
                  return validateEmail(email);
                },
                focusNode: emailFocus,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: false,
                focusPush: emailFocus,
              ),
              SizedBox(
                height: height / 20,
              ),
              SizedBox(
                width: double.infinity,
                height: height / 16,
                child: ElevatedButton(
                  onPressed: validateAndSave,
                  child: const Text('SEND'),
                ),
              ),
              SizedBox(height: height / 4),
              SocialMediaBlock(
                googleAuth: () {},
                facebookAuth: () {},
                label: 'Or sign up with social account',
              ),
              SizedBox(height: height / 20),
            ],
          ),
        ),
      ),
    );
  }
}
