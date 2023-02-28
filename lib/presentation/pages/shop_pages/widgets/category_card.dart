import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
        required this.categoryTitle,
        required this.imageLink})
      : super(key: key);
  final String categoryTitle;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  categoryTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(8)),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage('http://192.168.0.104:1337$imageLink'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}