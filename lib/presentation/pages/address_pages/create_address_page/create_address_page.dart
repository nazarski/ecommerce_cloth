import 'package:ecommerce_cloth/core/utils/helpers/auth_helpers.dart';
import 'package:ecommerce_cloth/core/utils/helpers/regexp_helpers.dart';
import 'package:ecommerce_cloth/data/models/user_model/user_address_model.dart';
import 'package:ecommerce_cloth/domain/entities/user_entity/user_address_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/textfield_validator.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_user_state/adresses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAddressPage extends ConsumerStatefulWidget {
  final UserAddressModel? addressModel;

  const CreateAddressPage({Key? key, this.addressModel}) : super(key: key);
  static const routeName = 'create-addresses-page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateAddressPageState();
}

class _CreateAddressPageState extends ConsumerState<CreateAddressPage> {
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
  UserAddressEntity? addressModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as UserAddressEntity?;
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
                child: Consumer(
                  builder: (context, ref, child) {
                    ref.listen(getAllUserAddressesProvider, (previous, next) {
                      if (next.hasValue) {
                        Navigator.pop(context);
                      }
                    });
                    final provider = ref.watch(getAllUserAddressesProvider);

                    return provider.when(
                      data: (_) {
                        return ElevatedButton(
                          onPressed: () {
                            final UserAddressEntity addressEntity = UserAddressEntity(
                              addressId: addressModel?.addressId ?? 0,
                              address: addressController.text,
                              city: cityController.text,
                              country: countryController.text,
                              fullName: fullNameController.text,
                              primary: false,
                              region: regionController.text,
                              zipCode: zipCodeController.text,
                            );
                            if (validateAndSaveHelper(formKey: formKey)) {
                              addressModel != null
                                  ? ref
                                      .read(getAllUserAddressesProvider.notifier)
                                      .updateUserAddress(addressEntity: addressEntity)
                                  : ref
                                      .read(getAllUserAddressesProvider.notifier)
                                      .postUserAddress(addressEntity: addressEntity);
                            }
                          },
                          child: const Text('SAVE ADDRESS'),
                        );
                      },
                      error: (_, __) {
                        return const ElevatedButton(
                          onPressed: null,
                          child: Icon(
                            Icons.error_outline_rounded,
                            color: Colors.white,
                          ),
                        );
                      },
                      loading: () {
                        return const ElevatedButton(
                          onPressed: null,
                          child: Center(child: CircularProgressIndicator.adaptive()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
