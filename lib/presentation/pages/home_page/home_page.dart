import 'package:ecommerce_cloth/core/enums/product_slider_type.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/product_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height * 0.66,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/banner.jpg',
                  ),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion\nsale',
                        style: TextStyle(
                            fontSize: 48,
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: ElevatedButton(
                          onPressed: ()async  {
                            await launchUrl(Uri.parse('https://www.lamoda.co.uk'));
                          },
                          child: const Text(
                            'Check',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const ProductSlider(
              type: ProductSliderType.newProducts,
              subtitle: 'You\'ve never seen it before!',
            )
          ],
        ),
      ),
    );
  }
}
