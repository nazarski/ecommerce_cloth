import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/widgets/social_auth_button.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = 'registration_page';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FocusNode userNameFocus = FocusNode();

  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final dio = Dio();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> signInGoogle() async {
    _googleSignIn.signIn().then(
      (account) {
        login(
          email: account!.email,
          username: account.displayName.toString(),
        );
        log(account.authHeaders.toString());
      },
    );
  }

  Future<void> signInFacebook() async {
    _facebookAuth.login().then((value) {
      _facebookAuth.getUserData().then(
        (account) {
          login(
            email: account['email'],
            username: account['name'],
          );
          log(account.toString());
        },
      );
    });
  }

  Future<Map<String, dynamic>> login({required String email, required String username}) async {
    try {
      Response response = await dio.post(
        'http://bugsmakersteam.pp.ua:1337/api/auth/local',
        data: {
          'identifier': email,
          'password': email,
        },
      );

      if (response.statusCode == 400) {
        registerUser(email: email, username: username, typeOfAuth: 'social');
        throw Exception('Invalid email or password');
      }
      log('Successful authorization ✅ :  ${response.data}');
      return response.data;
    } on DioError catch (e) {
      registerUser(email: email, username: username, typeOfAuth: 'social');
      throw Exception('Error logging in ${e.message}');
    }
  }

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String username,
    required String typeOfAuth,
    String? password,
  }) async {
    String? strapiPassword;
    try {
      switch (typeOfAuth) {
        case 'social':
          strapiPassword = email;
          break;
        case 'standard':
          strapiPassword = password;
          break;
      }
      Response response = await dio.post(
        'http://bugsmakersteam.pp.ua:1337/api/auth/local/register',
        data: {
          'username': username,
          'email': email,
          'password': strapiPassword,
        },
      );

      log('Successful registration ✅ : ${response.data}');
      return response.data;
    } on DioError catch (e) {
      throw Exception('Error registering user: ${e.message}');
    }
  }

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
    return userName!.isEmpty || userName.length > 15 ? 'Please enter a correct username' : '';
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
      registerUser(
        email: emailController.text,
        username: userNameController.text,
        typeOfAuth: 'standard',
        password: passwordController.text,
      );
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
                  // context.router.push(LoginRoute());
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
                  await signInGoogle();
                },
                facebookAuth: () async {
                  await signInFacebook();
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
