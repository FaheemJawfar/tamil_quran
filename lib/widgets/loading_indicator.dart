import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatefulWidget {
  final double? size;
  const LoadingIndicator({
    this.size,
    super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size ?? 50.0,
      width: widget.size ?? 50.0,

      child: const CircularProgressIndicator(color: Colors.white,),
    );
  }
}
