import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_cloth/data/data_sources/remote/manage_products_data.dart';
import 'package:ecommerce_cloth/data/repositories/manare_products_repository_impl.dart';
import 'package:ecommerce_cloth/domain/repositories/manage_products_repository.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_products/get_products.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/widgets/social_auth_button.dart';
import 'package:ecommerce_cloth/presentation/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/routes/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  static const routeName = 'registration_page';
  final FocusNode userNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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

  String validateUserName(String? userName) {
    return userName!.isEmpty || userName.length > 15
        ? 'Please enter a correct username'
        : '';
  }

  String validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'This field is required and cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return '';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: height / 10,
              ),
              TextFieldValidator(
                labelText: 'Name',
                checkOfErrorOnFocusChange: true,
                validation: (userName) {
                  return validateUserName(userName);
                },
                focusNode: userNameFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: userNameController,
                keyboardType: TextInputType.name,
                autofocus: false,
                passwordVisible: false,
                focusPush: emailFocus,
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
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: false,
                focusPush: passwordFocus,
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFieldValidator(
                labelText: 'Password',
                checkOfErrorOnFocusChange: true,
                validation: (password) {
                  return validatePassword(password);
                },
                focusNode: passwordFocus,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: passwordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: true,
                focusPush: passwordFocus,
              ),
              SizedBox(
                height: height / 60,
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const LoginRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              SizedBox(
                width: double.infinity,
                height: height / 16,
                child: ElevatedButton(
                  onPressed: validateAndSave,
                  child: const Text('SIGN UP'),
                ),
              ),
              SizedBox(height: height / 8),
              SocialMediaBlock(
                googleAuth: () async {
                  context.router.push(MainRoute());
                },
                facebookAuth: () async {
                  FacebookAuth.instance.login(
                      permissions: ['public_profile', 'email']).then((value) {
                    FacebookAuth.instance.getUserData().then((userData) {
                      print(userData['name']);
                      print(userData['email']);
                    });
                  });
                },
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
