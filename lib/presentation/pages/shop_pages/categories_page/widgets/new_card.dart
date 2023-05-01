import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  const NewCard({Key? key, required this.attribute}) : super(key: key);
  final String attribute;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'New',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(8)),
                child: Image(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$attribute.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
