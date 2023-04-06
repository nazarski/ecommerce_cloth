import 'package:ecommerce_cloth/core/enums/authenticate_type.dart';
import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';

import 'package:ecommerce_cloth/domain/entities/user_entity/user_credential_entity.dart';

import 'package:ecommerce_cloth/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:ecommerce_cloth/presentation/pages/auth_pages/widgets/social_auth_button.dart';

import 'package:ecommerce_cloth/presentation/pages/main_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = 'registration_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final FocusNode userNameFocus = FocusNode();

  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    final authProvider = ref.watch(authControllerRegistrationProvider);
    ref.listen(authControllerRegistrationProvider, (previous, next) {

      if (next.hasError) {
        showErrorSnackBar(context);
        ref.invalidate(authControllerRegistrationProvider);
      }

      if(next.value != null && next.value!) {
        Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
      }



    });
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
                readOnly: false,
                labelText: 'Name',
                checkOfErrorOnFocusChange: true,
                validation: (userName) {
                  return validateUserNameHelper(userName);
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
                readOnly: false,
                labelText: 'Email',
                checkOfErrorOnFocusChange: true,
                validation: (email) {
                  return validateEmailHelper(email);
                },
                focusNode: emailFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
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
                readOnly: false,
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
              ),
              SizedBox(
                height: height / 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.routeName);
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
                      onPressed: () async {
                        final UserCredentialEntity userInfo = UserCredentialEntity(
                          username: userNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          type: AuthenticateType.registration,
                        );
                        if (validateAndSaveHelper(formKey: formKey)) {
                          await ref.read(authControllerRegistrationProvider.notifier).signInAnonymously(
                            userInfo,
                          );
                        }
                      },
                      child: authProvider.when(
                            data: (_) {
                              return const Text('SIGN UP');
                            },
                            error: (error, stackTrace) {
                              return const Text('Error');
                            },
                            loading: () => const CircularProgressIndicator.adaptive(
                            ),
                          )
                      // const Text('SIGN UP'),
                      )),
              SizedBox(height: height / 8),
              SocialMediaBlock(
                label: 'Or sign up with social account',
                ref: ref,
              ),
              SizedBox(height: height / 20),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnackBar(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('User with this email or login already exists')),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }
}
