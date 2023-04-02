import 'dart:io';

import 'package:ecommerce_cloth/presentation/riverpod/manage_reviews_state/create_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'add_picture_button.dart';
import 'image_source_selection.dart';

class ReviewPicturesListView extends ConsumerWidget {
  const ReviewPicturesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictureList = ref.watch(createReviewProvider).reviewPictures;
    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          if (i == pictureList.length && pictureList.length <= 5) {
            return AddPictureButton(
              action: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ImageSourceSelection(
                        camera: () {
                          ref.read(createReviewProvider.notifier).addPicture(
                                ImageSource.camera,
                              );
                        },
                        gallery: () {
                          ref.read(createReviewProvider.notifier).addPicture(
                                ImageSource.gallery,
                              );
                        },
                      );
                    });
              },
            );
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.file(
              File(pictureList[i],),
              fit: BoxFit.cover,
              height: 104,
              width: 104,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 16,
        ),
        itemCount: pictureList.length <= 5
            ? pictureList.length + 1
            : pictureList.length,
      ),
    );
  }
}
