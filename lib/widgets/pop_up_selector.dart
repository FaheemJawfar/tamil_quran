import 'package:flutter/material.dart';

class PopupSelector<T> extends StatefulWidget {
  final List<T> listOfItems;
  final T selectedItem;
  final ValueChanged<T> onSelected;
  final String title;
  final String Function(T item) displayNameExtractor;

  const PopupSelector({
    required this.listOfItems,
    required this.selectedItem,
    required this.onSelected,
    required this.displayNameExtractor,
    this.title = 'Select an item',
    Key? key,
  }) : super(key: key);

  @override
  State<PopupSelector<T>> createState() => _PopupSelectorState<T>();
}

class _PopupSelectorState<T> extends State<PopupSelector<T>> {
  late T selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.listOfItems.map((item) {
            final displayName = widget.displayNameExtractor(item);
            return RadioListTile<T>(
              title: Text(displayName),
              value: item,
              groupValue: selectedItem,
              onChanged: (value) {
                setState(() {
                  selectedItem = value as T;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: () {
            widget.onSelected(selectedItem);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}