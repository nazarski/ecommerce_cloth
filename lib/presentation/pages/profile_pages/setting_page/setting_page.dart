import 'package:ecommerce_cloth/core/utils/helpers/date_input_formatter.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/widgets/bottom_sheet_markings.dart';
import 'package:ecommerce_cloth/presentation/pages/profile_pages/setting_page/widgets/custom_switch.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/navigation/restart_app.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/authentication_state.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/user_info_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/build_show_modal_bottom_sheet.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = 'setting-page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  final FocusNode _fullNameFocus = FocusNode();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(text: '************');
  final DateInputFormatter _dateFormatter = DateInputFormatter();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _fakeFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isFieldsFullNameValid = false;
  bool isFieldDateValid = false;
  bool switchSales = true;
  bool switchNewArrivals = false;
  bool switchDeliveryStatus = false;
  final int zero = 0;

  @override
  Widget build(BuildContext context) {
    final updateUserWatch = ref.watch(updateUserProvider);
    ref.listen(updateUserProvider, (previous, next) {
      if (next.hasError) {
        ref.invalidate(updateUserProvider);
      }
      if (next.value != null && next.value!) {}
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                TextFieldValidator(
                  readOnly: false,
                  labelText: 'Full name',
                  checkOfErrorOnFocusChange: true,
                  validation: (fullName) {
                    final validate = validateFullNameHelper(fullName);
                    if (validate.isEmpty) {
                      setState(() {
                        isFieldsFullNameValid = true;
                      });
                    }
                    return validate;
                  },
                  focusNode: _fullNameFocus,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  tempTextEditingController: _fullNameController,
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  passwordVisible: false,
                  focusPush: _fullNameFocus,
                ),
                const SizedBox(height: 20),
                TextFieldValidator(
                    readOnly: false,
                    labelText: 'Date of birth',
                    checkOfErrorOnFocusChange: true,
                    validation: (date) {
                      final validate = validateDateHelper(date);
                      if (validate.isEmpty) {
                        setState(() {
                          isFieldDateValid = true;
                        });
                      }
                      return validate;
                    },
                    focusNode: _dateFocus,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      _dateFormatter,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    tempTextEditingController: _dateController,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    passwordVisible: false,
                    focusPush: _dateFocus),
                const SizedBox(height: 15),
                isFieldDateValid || isFieldsFullNameValid
                    ? ElevatedButton(
                        onPressed: () async {
                          await ref
                              .read(updateUserProvider.notifier)
                              .updateUser(_fullNameController.text,
                                  _dateController.text);
                          setState(() {
                            isFieldDateValid = false;
                            isFieldsFullNameValid = false;
                          });
                        },
                        child: updateUserWatch.when(
                          data: (_) {
                            return const Text('SAVE');
                          },
                          error: (error, stackTrace) {
                            return const Text('ERROR');
                          },
                          loading: () => const CircularProgressIndicator(
                            strokeWidth: 4,
                            color: Colors.white,
                          ),
                        ))
                    : const SizedBox(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        buildShowModalBottomSheet(
                            context: context,
                            child: const BottomSheetResetPassword(),
                            header: 'Password Change');
                      },
                      child: Text(
                        'Change',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFieldValidator(
                  readOnly: true,
                  labelText: 'Password',
                  checkOfErrorOnFocusChange: true,
                  validation: () {},
                  focusNode: _fakeFocus,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  tempTextEditingController: _passwordController,
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  passwordVisible: false,
                  focusPush: _fullNameFocus,
                ),
                const SizedBox(height: 50),
                Text(
                  'Notifications',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sales', style: Theme.of(context).textTheme.bodySmall),
                    const CustomSwitch()
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  'Managements',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    ref.read(logOutProvider);
                    // ref.invalidate(bankCardsProvider);
                    // ref.invalidate(getAllUserAddressesProvider);
                    RestartWidget.restartApp(context);
                    // Navigator.of(context, rootNavigator: true)
                    //     .pushNamedAndRemoveUntil(
                    //         SplashScreen.routeName, (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Log Out',
                          style: Theme.of(context).textTheme.bodySmall),
                      Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
