import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:ecommerce_cloth/domain/entities/review_entity/review_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/gallery_page/gallery_page.dart';
import 'package:ecommerce_cloth/presentation/pages/widgets/star_view_widget.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key, required this.review}) : super(key: key);
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 20)
                ]),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 14,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarsViewWidget(rating: review.rating),
                    Text(
                      '${review.publicationDate.year}-${review.publicationDate.month}-${review.publicationDate.day}',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  review.review,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (review.reviewPictures.isEmpty) ...[
                  const SizedBox(
                    height: 12,
                  ),
                ] else ...[
                  ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return GalleryPage(
                                  index: i,
                                  listOfImages: review.reviewPictures);
                            }),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            height: 104,
                            width: 104,
                            image: NetworkImage(
                                '${StrapiInitialize.endpoint}${review.reviewThumbnailPictures[i]}'),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 16,
                    ),
                    itemCount: review.reviewPictures.length,
                  )
                ],
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Helpful',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.thumb_up_alt_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image(
            width: 32,
            height: 32,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            image: NetworkImage(review.userAvatar),
          ),
        )
      ],
    );
  }
}