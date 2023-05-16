import 'package:equatable/equatable.dart';

class UserAddressEntity extends Equatable {
  final int addressId;
  final String address;
  final String city;
  final String country;
  final String fullName;
  final bool primary;
  final String region;
  final String zipCode;

  const UserAddressEntity({
    this.addressId = 0,
    this.address = '',
    this.city = '',
    this.country = '',
    this.fullName = '',
    this.primary = false,
    this.region = '',
    this.zipCode = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        addressId,
        address,
        city,
        country,
        fullName,
        primary,
        region,
        zipCode,
      ];

  UserAddressEntity copyWith({
    int? addressId,
    String? address,
    String? city,
    String? country,
    String? fullName,
    bool? primary,
    String? region,
    String? zipCode,
  }) {
    return UserAddressEntity(
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
}
