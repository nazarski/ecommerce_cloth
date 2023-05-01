import 'package:flutter/material.dart';

class ProductDropdown extends StatelessWidget {
  const ProductDropdown({
    super.key,
    required this.listOfValues,
    required this.valueType,
  });

  final List<String> listOfValues;
  final String valueType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 0.8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 0.8,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(8),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          elevation: 0,
          hint: Text(valueType),
          items: List.generate(listOfValues.length, (i) {
            final String value = listOfValues[i];
            return DropdownMenuItem(
              value: value,
              child: Text(
                value[0].toUpperCase() + value.substring(1),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }),
          onChanged: (value) {}),
    );
  }
}
