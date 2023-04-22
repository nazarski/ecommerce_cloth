import 'package:ecommerce_cloth/presentation/pages/widgets/build_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/select_size_sheet.dart';

class SizesSelectorButton extends ConsumerStatefulWidget {
  const SizesSelectorButton({
    super.key,
    required this.sizes,
  });

  final List<String> sizes;

  @override
  ConsumerState<SizesSelectorButton> createState() =>
      _SizesSelectorButtonState();
}

class _SizesSelectorButtonState extends ConsumerState<SizesSelectorButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = true;
        });
        buildShowModalBottomSheet(
          context: context,
          header: 'Select size',
          child: SelectSizeSheet(
            onPressed: (String size){},
            buttonText: 'add to cart',
            sizes: widget.sizes,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
          border: _isActive
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 1)
              : Border.all(
                  color: Theme.of(context).colorScheme.surface, width: 0.8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            Text(
              'Size',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
