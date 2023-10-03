import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final Color color;
  const LoadingIndicator({
    this.size,
    this.color = Colors.white,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 50.0,
      width: size ?? 50.0,
      child: CircularProgressIndicator(color: color,),
    );
  }
}
