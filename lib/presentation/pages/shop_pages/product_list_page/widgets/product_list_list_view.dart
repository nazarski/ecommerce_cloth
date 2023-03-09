import 'package:ecommerce_cloth/presentation/pages/widgets/heart_favourite.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductListListView extends StatelessWidget {
  const ProductListListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              children: [
                Container(
                  height: 112,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 5),
                            blurRadius: 5)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      children: [
                        Image(
                          image: const AssetImage('assets/images/men.jpg'),
                          width: MediaQuery.of(context).size.width * .33,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Pullover',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Mango',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const StarsViewWidget(rating: 4, reviews: 12),
                            Text(
                              '650\$',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: HeartFavourite(
                    active: false,
                  ),
                ),
              ],
            ),
          );
        }),
        itemExtent: 140);
  }
}