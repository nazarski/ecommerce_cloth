import 'package:ecommerce_cloth/domain/entities/product_filter_entity/product_filter_entity.dart';
import 'package:ecommerce_cloth/presentation/pages/filter_pages/filter_nest_page.dart';
import 'package:ecommerce_cloth/presentation/pages/shop_pages/product_list_page/widgets/sort_type_button.dart';
import 'package:flutter/material.dart';

class ProductListToolBox extends StatelessWidget {
  const ProductListToolBox({
    super.key,
    required this.changeView, required this.changeSortType,
  });
final ValueChanged<ProductFilterEntity> changeSortType;
  final VoidCallback changeView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(FilterNestPage.routeName);
            },
            icon: const Icon(Icons.filter_list_rounded),
            label: const Text('Filters'),
          ),
          SortTypeButton(changeSortType: changeSortType,),
          _ChangeViewIconButton(changeView: changeView),
        ],
      ),
    );
  }
}

class _ChangeViewIconButton extends StatefulWidget {
  const _ChangeViewIconButton({Key? key, required this.changeView})
      : super(key: key);
  final VoidCallback changeView;

  @override
  State<_ChangeViewIconButton> createState() => _ChangeViewIconButtonState();
}

class _ChangeViewIconButtonState extends State<_ChangeViewIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isGrid = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeView() {
    setState(() {
      isGrid = !isGrid;
      isGrid ? _animationController.forward() : _animationController.reverse();
    });
    widget.changeView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      padding: const EdgeInsets.all(8),
      shape: const CircleBorder(),
      onPressed:  _changeView,
      child: AnimatedIcon(
            icon: AnimatedIcons.list_view, progress: _animationController),
    );
  }
}
