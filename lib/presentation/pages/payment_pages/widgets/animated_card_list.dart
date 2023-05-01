import 'package:ecommerce_cloth/presentation/pages/widgets/shimmer_widget.dart';
import 'package:ecommerce_cloth/presentation/riverpod/manage_bank_state/manage_bank_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bank_card_widget.dart';

class AnimatedCardList extends StatefulWidget {
  const AnimatedCardList({Key? key}) : super(key: key);

  @override
  State<AnimatedCardList> createState() => _AnimatedCardListState();
}

class _AnimatedCardListState extends State<AnimatedCardList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  double _listHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final listOfCards = ref.watch(bankCardsProvider);
      return listOfCards.when(
        data: (data) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: _listHeight,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: data.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: animation.value,
                  child: SizedBox(
                    height: animation.value,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: BankCardWidget(
                        isActiveCard: index == 0,
                        cardEntity: data[index],
                      ),
                    ),
                  ),
                );
              },
            ),
            onEnd: () {
              setState(() {
                _listHeight = _listKey.currentContext?.size?.height ?? 0;
              });
            },
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const ShimmerWidget(
            height: 150,
          );
        },
      );
    });
  }
}
