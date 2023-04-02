import 'package:flutter/material.dart';
import 'package:projectv_2/services/itemservice.dart';

class NewItemScreen extends StatelessWidget {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _itemDesc = TextEditingController();
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Anime",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Anime",
              // Define Text Style
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _itemName,
              decoration: InputDecoration(
                hintText: "Enter Anime name",
                // Define Input Decoration Style
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Anime Description",
              // Define Text Style
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _itemDesc,
              decoration: InputDecoration(
                hintText: "Enter Anime description",
                // Define Input Decoration Style
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _addItem(context);
                },
                child: Text(
                  "Save",
                  // Define Text Style
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Define Button Style
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey[900],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addItem(BuildContext context) {
    _itemService.addItem2Firebase(
        _itemName.text, {"name": _itemName.text, "desc": _itemDesc.text});
    Navigator.pop(context);
  }
}
