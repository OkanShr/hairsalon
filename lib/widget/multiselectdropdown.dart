import 'package:flutter/material.dart';

class Multiselectdropdown extends StatefulWidget {
  const Multiselectdropdown({Key? key}) : super(key: key);

  @override
  State<Multiselectdropdown> createState() => _MultiselectdropdownState();
}

class _MultiselectdropdownState extends State<Multiselectdropdown> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String> items = [
      'Alerji 1',
      'Alerji 2',
      'Alerji 3',
      'Alerji 4',
      'Alerji 5',
      'Alerji 6',
      'Alerji 7',
      'Alerji 8',
      'Alerji 9',
      'Alerji 10',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 15, bottom: 15),
            ),
            onPressed: _showMultiSelect,
            child: const Text(
              'Alerji Ekle',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: 400,
            child: Wrap(
              children: _selectedItems
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Chip(
                          label: Text(e),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          backgroundColor: Colors.black,
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alerjileri Sec'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        )
      ],
    );
  }
}
