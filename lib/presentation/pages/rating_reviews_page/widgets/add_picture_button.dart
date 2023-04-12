import 'package:ecommerce_cloth/presentation/pages/rating_reviews_page/widgets/red_wrap_circle_icon.dart';
import 'package:flutter/material.dart';

class AddPictureButton extends StatelessWidget {
  const AddPictureButton({
    super.key,
    required this.action,
  });

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Theme(
        data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: Container(
          height: 104,
          width: 104,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const RedWrapCircleIcon(icon: Icons.add_rounded),
              Text(
                'Add your photos',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
