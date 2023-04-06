
import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/snack_bars.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BottomSheetResetPassword extends ConsumerStatefulWidget {
  const BottomSheetResetPassword({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomSheetResetPasswordState();
}

class _BottomSheetResetPasswordState extends ConsumerState<BottomSheetResetPassword> {
  final FocusNode _oldPasswordFocus = FocusNode();

  final FocusNode _newPasswordFocus = FocusNode();

  final FocusNode _repeatPasswordFocus = FocusNode();

  final TextEditingController _oldPasswordController = TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _repeatPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final resetPassword = ref.watch(resetPasswordProvider);
    ref.listen(resetPasswordProvider, (previous, next) {
      if (next.hasError) {
        topSnackBar(context: context, label: 'Oops, you have entered an incorrect current password');
      }
      if (next.value != null && next.value!) {
        Navigator.of(context).pop();
        topSnackBar(context: context, label: 'Super! Password changed successfully');
      }
    });

    return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 16, left: 16, right: 15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFieldValidator(
                labelText: 'Old Password',
                checkOfErrorOnFocusChange: true,
                validation: (password) {
                  return validatePasswordHelper(password);
                },
                focusNode: _oldPasswordFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: _oldPasswordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: true,
                focusPush: _newPasswordFocus,
                readOnly: false,
              ),
              const SizedBox(height: 40),
              TextFieldValidator(
                labelText: 'New Password',
                checkOfErrorOnFocusChange: true,
                validation: (password) {
                  return validatePasswordHelper(password);
                },
                focusNode: _newPasswordFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: _newPasswordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: true,
                focusPush: _repeatPasswordFocus,
                readOnly: false,
              ),
              const SizedBox(height: 20),
              TextFieldValidator(
                labelText: 'Repeat New Password',
                checkOfErrorOnFocusChange: true,
                validation: (validator) {
                  if (validator.isEmpty) return 'This field is required and cannot be empty';
                  if (validator != _newPasswordController.text) {
                    return 'The passwords do not match';
                  }
                  return '';
                },
                focusNode: _repeatPasswordFocus,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(18),
                ],
                tempTextEditingController: _repeatPasswordController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                passwordVisible: true,
                focusPush: _repeatPasswordFocus,
                readOnly: false,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final String currentPassword = _oldPasswordController.text;
                    final String newPassword = _newPasswordController.text;
                    if (validateAndSaveHelper(formKey: formKey)) {
                      await ref.read(resetPasswordProvider.notifier).resetPassword(currentPassword, newPassword);
                      print('ok');
                    }
                  },
                  child: resetPassword.when(
                    data: (_) {
                      return const Text('SAVE PASSWORD');
                    },
                    error: (error, stackTrace) {
                      return const Text('Error');
                    },
                    loading: () => const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  void showErrorSnackBarResetPassword({
    required BuildContext context,
    required String label,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150, right: 20, left: 20),
          behavior: SnackBarBehavior.floating,
          content: Center(child: Text(label)),
          duration: const Duration(seconds: 4),
        ),
      );
    });
  }
}

//ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(
//     content: Text('Ваше сообщение'),
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.red,
//     duration: Duration(seconds: 3),
//     margin: EdgeInsets.only(top: kToolbarHeight),
//   ),
// );
