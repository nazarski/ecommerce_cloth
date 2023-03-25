import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool? switchValue;
  void Function(bool)? onChanged;


  CustomSwitch({
    super.key,
    this.switchValue,

    required this.onChanged
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .8,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.switchValue!
                  ? Theme.of(context).colorScheme.onError.withOpacity(0.2)
                  : Colors.white54.withOpacity(0.2),
              spreadRadius: 0.4,
              blurRadius: 10,
              offset: widget.switchValue! ? const Offset(10, 1) : const Offset(-10, 1),
            )
          ],
        ),
        child: CupertinoSwitch(
          activeColor: Colors.grey.withOpacity(0.1),
          value: widget.switchValue!,
          thumbColor:
              widget.switchValue! ? Theme.of(context).colorScheme.onError : Theme.of(context).colorScheme.background,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
