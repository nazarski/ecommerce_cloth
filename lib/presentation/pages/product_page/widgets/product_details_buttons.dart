import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'details_item.dart';

class ProductDetailsButtons extends StatelessWidget {
  const ProductDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Divider(
          height: 0,
        ),
        // DetailsItem(
        //   title: 'Item details',
        // ),
        const Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Shipping info', onTap: () async {
           await  launchUrl(Uri.parse('https://eu.lamoda.co.uk/about-us/'));
        },
        ),
        const Divider(
          height: 0,
        ),
        DetailsItem(
          title: 'Support', onTap: () async {
          await  launchUrl(Uri.parse('https://eu.lamoda.co.uk/customer-care-center/'));
        },
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
