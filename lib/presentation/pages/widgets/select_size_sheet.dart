import 'package:ecommerce_cloth/presentation/pages/product_page/widgets/details_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectSizeSheet extends StatefulWidget {
  const SelectSizeSheet({
    super.key,
    required this.sizes,
    required this.onPressed,
    required this.buttonText,
  });

  final List<String> sizes;
  final ValueChanged<String> onPressed;
  final String buttonText;

  @override
  State<SelectSizeSheet> createState() => _SelectSizeSheetState();
}

class _SelectSizeSheetState extends State<SelectSizeSheet> {
  String selectedSize = '';

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 22,
          runSpacing: 16,
          children: List.generate(widget.sizes.length, (index) {
            final String size = widget.sizes[index];
            return _SizeItem(
              size: size,
              action: () {
                _selectSize(size);
              },
              isActive: selectedSize == size,
            );
          }),
        ),
        const SizedBox(
          height: 24,
        ),
        const Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Size info',
          onTap: () async {
            await launchUrl(Uri.parse('https://www.lamoda.co.uk/size-guide/'));
          },
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              widget.onPressed(selectedSize);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(widget.buttonText.toUpperCase()),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  const _SizeItem({
    required this.size,
    required this.action,
    required this.isActive,
  });

  final String size;
  final VoidCallback action;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 0.8,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface),
        ),
        child: Center(
          child: Text(
            size,
            style: isActive
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
