import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/widgets/red_wrap_circle_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceSelection extends StatelessWidget {
  const ImageSourceSelection({
    super.key,
    required this.camera,
    required this.gallery,
  });
  final VoidCallback camera;
  final VoidCallback gallery;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                camera();
              },
              child: Column(
                children: [
                  const RedWrapCircleIcon(
                    icon: Icons.camera_alt_rounded,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Camera',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                gallery();
              },
              child: Column(
                children: [
                  const RedWrapCircleIcon(
                      icon: CupertinoIcons.photo_fill_on_rectangle_fill),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
