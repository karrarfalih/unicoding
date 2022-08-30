import 'package:flutter/material.dart';
import 'package:unicoding/utilz/theme.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    Key? key,
    required this.child,
    this.thickness = 3
  }) : super(key: key);
  final Widget child;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.mainColor),
          boxShadow: [
            BoxShadow(
                color: AppTheme.mainColor,
                spreadRadius: thickness,
                offset: Offset(thickness, thickness)
            )
          ]
      ),
      child: child,
    );
  }
}
