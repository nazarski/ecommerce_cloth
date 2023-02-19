class UserAddressModel{
  final String addressId;
  final String address;
  final String city;
  final String country;
  final String fullName;
  final bool primary;
  final String region;
  final String zipCode;

  const UserAddressModel({
    required this.addressId,
    required this.address,
    required this.city,
    required this.country,
    required this.fullName,
    required this.primary,
    required this.region,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'UserAddressModel{'
        'addressId: $addressId, '
        'address: $address, '
        'city: $city, '
        'country: $country, '
        'fullName: $fullName, '
        'primary: $primary, '
        'region: $region, '
        'zipCode: $zipCode,'
        '}';
  }

  UserAddressModel copyWith({
    String? addressId,
    String? address,
    String? city,
    String? country,
    String? fullName,
    bool? primary,
    String? region,
    String? zipCode,
  }) {
    return UserAddressModel(
      addressId: addressId ?? this.addressId,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      fullName: fullName ?? this.fullName,
      primary: primary ?? this.primary,
      region: region ?? this.region,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addressId': addressId,
      'address': address,
      'city': city,
      'country': country,
      'fullName': fullName,
      'primary': primary,
      'region': region,
      'zipCode': zipCode,
    };
  }

  factory UserAddressModel.fromMap(Map<String, dynamic> map) {
    return UserAddressModel(
      addressId: map['addressId'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      fullName: map['fullName'] as String,
      primary: map['primary'] as bool,
      region: map['region'] as String,
      zipCode: map['zipCode'] as String,
    );
  }

//</editor-fold>
}