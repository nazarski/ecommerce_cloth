import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                SaleCard(),
                SizedBox(
                  height: 16,
                ),
                NewCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  const NewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/new.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class SaleCard extends StatelessWidget {
  const SaleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onSurface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'summer sale'.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Up to 50% off',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
