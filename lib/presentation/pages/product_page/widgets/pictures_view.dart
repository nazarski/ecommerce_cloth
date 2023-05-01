import 'package:flutter/material.dart';

class PicturesView extends StatelessWidget {
  PicturesView({
    super.key,
    required this.images,
    required this.productId,
  }) : _controller = PageController(viewportFraction: 0.8);

  final PageController _controller;
  final List<String> images;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * .5,
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
                      image: NetworkImage(images[i]),
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
                  image: NetworkImage(images[i]),
                ),
              );
            }),
      ),
    );
  }
}
