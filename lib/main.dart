import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemSelectionScreen(),
    );
  }
}

class ItemSelectionScreen extends StatefulWidget {
  @override
  _ItemSelectionScreenState createState() => _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  List<ItemModel> items = [
    ItemModel("Item 1", false),
    ItemModel("Item 2", false),
    ItemModel("Item 3", false),
    ItemModel("Item 4", false),
    ItemModel("Item 5", false),
  ];

  int selectedCount = 0;

  void toggleItemSelection(int index) {
    setState(() {
      items[index].isSelected = !items[index].isSelected;
      if (items[index].isSelected) {
        selectedCount++;
      } else {
        selectedCount--;
      }
    });
  }

  void showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Items"),
          content: Text("Number of  selected item: $selectedCount "),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Selection Screen"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            onTap: () {
              toggleItemSelection(index);
            },
            tileColor: items[index].isSelected ? Colors.blue : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSelectionDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class ItemModel {
  final String name;
  bool isSelected;

  ItemModel(this.name, this.isSelected);
}
