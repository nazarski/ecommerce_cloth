String validateEmailHelper(String? value) {
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

String validateFullNameHelper(String? fullName) {
  const pattern = r'^[A-Z][a-z]+(\s[A-Z][a-z]+){1,2}$';
  final regex = RegExp(pattern);
  if (fullName!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(fullName)) {
    return 'Not a valid full name. Should be Volodya Culebyaka';
  } else {
    return '';
  }
}

String validateAddressHelper(String? address) {
  const pattern = r'^\d+\s+[A-Za-z0-9\s]+$';
  final regex = RegExp(pattern);
  if (address!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(address)) {
    return 'Not a valid address. Should be "3 Newbridge Court"';
  } else {
    return '';
  }
}

String validateCityHelper(String? city) {
  const pattern = r'^[A-Za-z]+(?:\s+[A-Za-z]+)*$';
  final regex = RegExp(pattern);
  if (city!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(city)) {
    return 'Not a valid city name. Should be "Chino Hills" or "Brovary"';
  } else {
    return '';
  }
}

String validateRegionHelper(String? region) {
  const pattern = r'^[A-Za-z]+(?:\s+[A-Za-z]+)*$';
  final regex = RegExp(pattern);
  if (region!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(region)) {
    return 'Not a valid region name. Should be "La Cañada Flintridge"';
  } else {
    return '';
  }
}

String validateZipCodeHelper(String? zipCode) {
  const pattern = r'^\d{5}$';
  final regex = RegExp(pattern);
  if (zipCode!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(zipCode)) {
    return 'Not a valid zip-code. Should be "91709"';
  } else {
    return '';
  }
}

String validateDateHelper(String? date) {
  const pattern = r'^\d{2}\/\d{2}\/\d{4}$';
  final regex = RegExp(pattern);
  if (date!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (!regex.hasMatch(date)) {
    return 'Not a valid date. Should be "12/12/2010';
  } else {
    return '';
  }
}

String valueIsEmpty(String? date) {
  if (date!.isEmpty) {
    return 'This field is required and cannot be empty';
  }
  return '';
}
