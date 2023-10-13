import 'package:flutter/material.dart';
import '../app_texts/app_widgets_texts.dart';

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
    this.title = AppWidgetsTexts.selectAnItem,
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
            return RadioListTile<T>(
              title: Text(widget.displayNameExtractor(item)),
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
          child: const Text(AppWidgetsTexts.popUpCancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text(AppWidgetsTexts.popUpSelect),
          onPressed: () {
            widget.onSelected(selectedItem);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
