import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAddressPage extends StatefulWidget {
  final UserAddressModel? addressModel;

  const CreateAddressPage({Key? key, this.addressModel}) : super(key: key);
  static const routeName = 'create-addresses-page';

  @override
  State<CreateAddressPage> createState() => _CreateAddressPageState();
}

class _CreateAddressPageState extends State<CreateAddressPage> {
  final FocusNode fullNameFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode regionFocus = FocusNode();
  final FocusNode zipCodeFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  UserAddressModel? addressModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as UserAddressModel?;
    if (args != null) {
      addressModel = args;
      fullNameController.text = addressModel!.fullName;
      addressController.text = addressModel!.address;
      cityController.text = addressModel!.city;
      regionController.text = addressModel!.region;
      zipCodeController.text = addressModel!.zipCode;
      countryController.text = addressModel!.country;
    }
  }

  @override
  Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)?.settings.arguments as UserAddressModel?;
// print(args);
//     final fullNameController = TextEditingController(text: args?.fullName ?? '');
//     final addressController = TextEditingController(text: args?.address ?? '');
//     final cityController = TextEditingController(text: args?.city ?? '');
//     final regionController = TextEditingController(text: args?.region ?? '');
//     final zipCodeController = TextEditingController(text: args?.zipCode ?? '');
//     final countryController = TextEditingController(text: args?.country ?? '');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'Full name',
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
                focusPush: addressFocus,
                readOnly: false,
              ),
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'Address',
                checkOfErrorOnFocusChange: true,
                validation: (address) {
                  return validateAddressHelper(address);
                },
                focusNode: addressFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                tempTextEditingController: addressController,
                keyboardType: TextInputType.streetAddress,
                autofocus: false,
                passwordVisible: false,
                focusPush: addressFocus,
                readOnly: false,
              ),
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'City',
                checkOfErrorOnFocusChange: true,
                validation: (city) {
                  return validateCityHelper(city);
                },
                focusNode: cityFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                tempTextEditingController: cityController,
                keyboardType: TextInputType.text,
                autofocus: false,
                passwordVisible: false,
                focusPush: regionFocus,
                readOnly: false,
              ),
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'Region',
                checkOfErrorOnFocusChange: true,
                validation: (region) {
                  return validateRegionHelper(region);
                },
                focusNode: regionFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                tempTextEditingController: regionController,
                keyboardType: TextInputType.text,
                autofocus: false,
                passwordVisible: false,
                focusPush: zipCodeFocus,
                readOnly: false,
              ),
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'Zip-Code',
                checkOfErrorOnFocusChange: true,
                validation: (zipCode) {
                  return validateZipCodeHelper(zipCode);
                },
                focusNode: zipCodeFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
                tempTextEditingController: zipCodeController,
                keyboardType: TextInputType.number,
                autofocus: false,
                passwordVisible: false,
                focusPush: zipCodeFocus,
                readOnly: false,
              ),
              const SizedBox(height: 15),
              TextFieldValidator(
                labelText: 'Country',
                checkOfErrorOnFocusChange: true,
                validation: (region) {
                  return validateRegionHelper(region);
                },
                focusNode: countryFocus,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                tempTextEditingController: countryController,
                keyboardType: TextInputType.text,
                autofocus: false,
                passwordVisible: false,
                focusPush: countryFocus,
                readOnly: false,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (validateAndSaveHelper(formKey: formKey)) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('SAVE ADDRESS'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
