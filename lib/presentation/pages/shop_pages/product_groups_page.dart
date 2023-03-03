import 'package:flutter/material.dart';

class ProductGroupPage extends StatelessWidget {
  const ProductGroupPage({Key? key}) : super(key: key);

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
        centerTitle: true,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('view all items'.toUpperCase()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Choose category',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, i) =>  Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  child: Text('Sweaters', style: Theme.of(context).textTheme.bodyLarge,),),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: 9))
        ],
      ),
    );
  }
}
