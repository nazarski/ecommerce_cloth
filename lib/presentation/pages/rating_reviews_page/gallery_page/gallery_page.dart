import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({
    super.key,
    this.index = 0,
    required this.listOfImages,
  }) : _controller = PageController(initialPage: index);
  final int index;
  final List<String> listOfImages;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: listOfImages.length,
      pageController: _controller,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          maxScale: PhotoViewComputedScale.covered,
          minScale: PhotoViewComputedScale.contained,
          imageProvider: NetworkImage(
              '${StrapiInitialize.endpoint}${listOfImages[index]}'),
        );
      },
    );
  }
}
