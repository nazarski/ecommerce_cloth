import 'package:flutter/material.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);
  static const routeName = 'filters-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Price range',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const FilterItemContainer(
            child: PriceRangeSlider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Colors',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          FilterItemContainer(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              'Sizes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const FilterItemContainer(
            child: SizesList(),
          ),
          ListTile(
            title: Text(
              'Brands',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              'Puma Puma Puma Puma Puma Puma Puma Puma Puma Puma Puma ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SizesList extends StatelessWidget {
  const SizesList({
    super.key,
  });

  static const _listOfSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _listOfSizes.map((e) {
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: Center(
            child: Text(
              e,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    super.key,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues rangeValues = const RangeValues(20, 140);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${rangeValues.start.toInt()}'),
            Text('\$${rangeValues.end.toInt()}')
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RangeSlider(
            min: 20,
            max: 140,
            values: rangeValues,
            onChanged: (RangeValues range) {
              setState(() {
                rangeValues = range;
              });
            },
          ),
        ),
      ],
    );
  }
}

class FilterItemContainer extends StatelessWidget {
  const FilterItemContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 20,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
