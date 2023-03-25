import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    if (newText.isEmpty) {
      return newValue;
    }
    if (newText.length > oldValue.text.length) {
      final buffer = StringBuffer();

      if (newText.length >= 3) {
        buffer.write('${newText.substring(0, 2)}/');
      } else {
        buffer.write(
          newText.substring(0, newText.length),
        );
        return TextEditingValue(
          text: buffer.toString(),
          selection: TextSelection.collapsed(offset: buffer.length),
        );
      }

      if (newText.length >= 5) {
        buffer.write('${newText.substring(3, 5)}/');
      } else {
        buffer.write(
          newText.substring(2, newText.length),
        );
        return TextEditingValue(
          text: buffer.toString(),
          selection: TextSelection.collapsed(offset: buffer.length),
        );
      }

      if (newText.length >= 6) {
        buffer.write(
          newText.substring(6, newText.length),
        );
      }

      return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.length),
      );
    } else {
      return newValue;
    }
  }
}
