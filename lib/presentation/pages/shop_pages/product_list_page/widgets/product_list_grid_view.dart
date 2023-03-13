import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ProductListGridView extends StatelessWidget {
  const ProductListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 204,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const Image(
                      image: AssetImage('assets/images/men.jpg'),
                      width: double.infinity,
                      height: 184,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onPrimary,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 4),
                          ]),
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                  const Positioned(
                      left: 0,
                      bottom: 0,
                      child: StarsViewWidget(
                        rating: 4,
                        reviews: 10,
                      ))
                ],
              ),
              Text(
                'Pullover',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Mango',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '650',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]);
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 260,
        childAspectRatio: 1 / 1.55,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        crossAxisCount: 2,
      ),
    );
  }
}
