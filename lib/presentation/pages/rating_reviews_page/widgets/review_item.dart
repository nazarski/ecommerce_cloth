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
          padding: const EdgeInsets.only(top: 16, left: 16,bottom: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 20)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 8),
                  child: Text(
                    review.userName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarsViewWidget(rating: review.rating),
                      Text(
                        '${review.publicationDate.year}-${review.publicationDate.month}-${review.publicationDate.day}',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16, left: 24, right: 24.0),
                  child: Text(
                    review.review,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                if (review.reviewPictures.isNotEmpty) ...[
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
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
                              fit: BoxFit.cover,
                              width: 104,
                              image: NetworkImage(review.reviewThumbnailPictures[i]),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        width: 16,
                      ),
                      itemCount: review.reviewPictures.length,
                    ),
                  )
                ],
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Icon(Icons.report_outlined, color: Theme.of(context).colorScheme.primary,),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                            ),
                          ],
                        )
                      ],
                    ),
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
            image: review.userAvatar.isNotEmpty
                ? NetworkImage(review.userAvatar)
                : const AssetImage('assets/images/no_avatar.png')
                    as ImageProvider,
          ),
        )
      ],
    );
  }
}
