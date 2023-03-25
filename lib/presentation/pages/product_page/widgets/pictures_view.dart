import 'package:ecommerce_cloth/data/data_sources/remote/strapi_initialize.dart';
import 'package:flutter/material.dart';

class PicturesView extends StatelessWidget {
  PicturesView({
    super.key,
    required this.height,
    required this.width,
    required this.images,
    required this.productId,
  }) : _controller = PageController(viewportFraction: 0.8);

  final double height;
  final PageController _controller;
  final double width;
  final List<String> images;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .7,
      child: Scrollbar(
        controller: _controller,
        child: PageView.builder(
            padEnds: false,
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Hero(
                  tag: productId,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image(
                      width: width,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${StrapiInitialize.endpoint}${images[i]}'),
                    ),
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.only(
                  right: images.length - 1 > i ? 12 : 0,
                ),
                child: Image(
                  width: width,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${StrapiInitialize.endpoint}${images[i]}'),
                ),
              );
            }),
      ),
    );
  }
}
