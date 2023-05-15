import 'package:equatable/equatable.dart';

class UserAddressEntity extends Equatable {
  final int addressId;
  final String address;
  final String city;
  final String country;
  final String fullName;
   bool? primary;
  final String region;
  final String zipCode;

   UserAddressEntity({
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
