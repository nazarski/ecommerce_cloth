import 'package:equatable/equatable.dart';

class UserAddressEntity extends Equatable {
  final String addressId;
  final String address;
  final String city;
  final String country;
  final String fullName;
  final bool primary;
  final String region;
  final String zipCode;

  const UserAddressEntity({
    this.addressId = '',
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
}
