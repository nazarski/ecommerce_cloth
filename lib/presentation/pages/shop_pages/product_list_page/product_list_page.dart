import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);
  static const routeName = 'product-list-page';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 140,
          collapsedHeight: 60,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {},
          ),
          title: Text('Women tops'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
            width: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Container(
                  color: Colors.greenAccent,
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 5))
            ]),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list_rounded),
                  label: Text('Filters'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.swap_vert_rounded),
                  label: Text('Price: lowest to high'),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.grid_view_rounded))
              ],
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, i) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.red,
              );
            }),
            itemExtent: 20)
      ],
    );
  }
}
