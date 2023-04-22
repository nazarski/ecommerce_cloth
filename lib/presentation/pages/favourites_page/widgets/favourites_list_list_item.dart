import 'package:ecommerce_cloth/core/resources/app_icons.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesListListItem extends StatelessWidget {
  const FavouritesListListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/men.jpg',
                      width: width / 3,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LIME',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Shirt',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Color:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(
                                                width: 4,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Black',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text('30\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Size:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        const WidgetSpan(
                                          child: SizedBox(
                                            width: 4,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'L',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const StarsViewWidget(
                                    rating: 5,
                                    reviews: 10,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: MaterialButton(
              minWidth: 0,
              height: 0,
              padding: const EdgeInsets.all(2),
              shape: const CircleBorder(),
              onPressed: () {},
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.surface,
                size: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(
                  CircleBorder(),
                ),
              ),
              child: SvgPicture.asset(
                AppIcons.bagFilled,
                height: 16,
                width: 16,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
