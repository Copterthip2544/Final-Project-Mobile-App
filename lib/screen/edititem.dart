import 'package:flutter/material.dart';
import 'package:projectv_2/services/itemservice.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen(this.documentid, this.itemName, this.itemDesc);

  final String documentid;
  final String itemName;
  final String itemDesc;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemDescController = TextEditingController();
  final ItemService itemService = ItemService();

  @override
  void initState() {
    super.initState();
    itemNameController.text = widget.itemName;
    itemDescController.text = widget.itemDesc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Anime Details",
          // Define Text Style
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(
                labelText: "Anime name",
              ),
            ),
            TextField(
              controller: itemDescController,
              decoration: const InputDecoration(
                labelText: "Anime description",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _deleteItem(context),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 181, 30, 30),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Text("Delete"),
            ),
            ElevatedButton(
              onPressed: () => _editItem(context),
              child: const Text("Edit"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editItem(BuildContext context) {
    if (itemNameController.text.isEmpty || itemDescController.text.isEmpty) {
      return;
    }
    itemService
        .editItem(
          context,
          {
            "name": itemNameController.text,
            "desc": itemDescController.text,
          },
          widget.documentid,
        )
        .then((value) => Navigator.pop(context));
    itemNameController.text = "";
    itemDescController.text = "";
  }

  void _deleteItem(BuildContext context) {
    if (itemNameController.text.isEmpty || itemDescController.text.isEmpty) {
      return;
    }
    itemService
        .deleteItem(
          context,
          widget.documentid,
        )
        .then((value) => Navigator.pop(context));
    itemNameController.text = "";
    itemDescController.text = "";
  }
}
