import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  final String address;
  final String city;
  final String country;
  final String fullName;
  final String region;
  final String zipCode;
  final VoidCallback onTap;
  bool? primary;

  AddressItem({
    super.key,
    required this.address,
    required this.city,
    required this.country,
    required this.fullName,
    required this.region,
    required this.zipCode,
    required this.primary,
    required this.onTap,
  });

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: 380,
      height: 170,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 0.75),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.fullName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              widget.address,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text(
                  widget.city,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 3),
                Text(
                  widget.region,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 3),
                Text(
                  widget.zipCode,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 3),
                Text(
                  widget.country,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    fillColor: const MaterialStatePropertyAll(
                      AppColorsDark.background,
                    ),
                    focusColor: Colors.orange,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    value: widget.primary,
                    onChanged: (bool? selected) {
                      setState(() {
                        widget.primary = selected!;
                      });
                    }),
              ),
              const SizedBox(width: 5),
              Text(
                'Use as the shipping address',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
