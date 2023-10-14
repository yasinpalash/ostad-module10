import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        //useMaterial3: true,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<ItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.search,color: Colors.blue,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Add Title'),
            ),
            const SizedBox(height: 8,),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Add Description'),
            ),
            ElevatedButton(
              onPressed: () {
                _addItem();
              },
              child: Text('Add'),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(

                    ),
                    title: Text('${items[index].title}'),
                    subtitle: Text('${items[index].description}'),
                    trailing: Icon(Icons.drive_file_move_outline),
                    onLongPress: () {
                      _showEditDeleteDialog(context, index);
                    },
                  );
                }, separatorBuilder: (BuildContext context, int index) {

                 return Divider(
                   height: 10,

                 );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addItem() {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      items.add(ItemModel(title, description));
      titleController.clear();
      descriptionController.clear();
      setState(() {});
    }
  }

  void _showEditDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          actions: <Widget>[

            TextButton(
              child: Text('Edit'),
              onPressed: () {
                Navigator.of(context).pop();
                _editItem(context, index);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editItem(BuildContext context, int index) {
    TextEditingController titleController = TextEditingController(text: items[index].title);
    TextEditingController descriptionController = TextEditingController(text: items[index].description);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[

              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    ),
              ),
              const SizedBox(height: 8,),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  items[index].title = titleController.text;
                  items[index].description = descriptionController.text;
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Text('Edit done'),
              ),

            ],
          ),
        );
      },
    );
  }

  void _deleteItem(int index) {
    items.removeAt(index);
    setState(() {});
  }
}

class ItemModel {
  String title;
  String description;

  ItemModel(this.title, this.description);
}
