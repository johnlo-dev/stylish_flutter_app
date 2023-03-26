import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({super.key, required this.spacerHeight});

  final double spacerHeight;

  @override
  Widget build(BuildContext context) {
    return Divider(height: spacerHeight, color: Colors.transparent);
  }
}
