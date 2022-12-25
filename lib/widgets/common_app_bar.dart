import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  final String label;

  CommonAppBar({required this.label, Key? key}) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.label,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      backgroundColor: Colors.green.shade900,
    );
  }


}