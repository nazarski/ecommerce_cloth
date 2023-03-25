import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';
import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/widgets/social_auth_button.dart';
import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/authentication_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = 'login_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    final authProvider = ref.watch(authControllerLoginProvider);
    ref.listen(authControllerLoginProvider, (previous, next) {
      if (next.hasError) {
        showErrorSnackBarLogin(context);
        ref.invalidate(authControllerLoginProvider);
      }
      if (next.value != null && next.value == true) {
        Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
      }
    });

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                'Login',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: height / 10,
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFieldValidator(
                labelText: 'Email',
                checkOfErrorOnFocusChange: true,
                validation: (email) {
                  return validateEmailHelper(email);
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
                readOnly: false,
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFieldValidator(
                labelText: 'Password',
                checkOfErrorOnFocusChange: true,
                validation: (password) {
                  return validatePasswordHelper(password);
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
                readOnly: false,
              ),
              SizedBox(
                height: height / 50,
              ),
              SizedBox(
                height: height / 40,
              ),
              SizedBox(
                width: double.infinity,
                height: height / 16,
                child: ElevatedButton(
                  onPressed: () async {
                    final UserCredentialEntity userInfo = UserCredentialEntity(
                      email: emailController.text,
                      password: passwordController.text,
                      type: AuthenticateType.authorization,
                    );
                    if (validateAndSaveHelper(formKey: formKey)) {
                      await ref.read(authControllerLoginProvider.notifier).signInAnonymously(userInfo);
                    }
                  },
                  child: authProvider.when(
                    data: (_) {
                      return const Text('SIGN UP');
                    },
                    error: (error, stackTrace) {
                      return const Text('Error');
                    },
                    loading: () => const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 4.5),
              SocialMediaBlock(
                ref: ref,
                label: 'Or sign up with social account',
              ),
              SizedBox(height: height / 20),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnackBarLogin(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Oops, you have entered an incorrect password and email.')),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
