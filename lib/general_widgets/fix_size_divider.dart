import 'package:flutter/cupertino.dart';

class FixedSizeDivider extends StatelessWidget {
  const FixedSizeDivider(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.padding});

  final double padding;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
          height: height, width: width, child: Container(color: color)),
    );
  }
}
