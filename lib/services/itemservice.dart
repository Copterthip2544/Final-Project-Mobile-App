import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ItemService {
  Future<void> addItem2Firebase(String documentid, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection("items")
        .add(data)
        .then((value) {
      print("Item Created");
    }).catchError((error) {
      print("Can't Create item:" + error.toString());
    });
  }

  Future<void> editItem(
      BuildContext context, Map<String, dynamic> data, String documentid) {
    return FirebaseFirestore.instance
        .collection("items")
        .doc(documentid)
        .update(data)
        .then((value) {
      print("Item Update");
    }).catchError((error) {
      print("Can't Update item:" + error.toString());
    });
  }

  Future<void> deleteItem(BuildContext context, String documentid) {
    return FirebaseFirestore.instance
        .collection("items")
        .doc(documentid)
        .delete()
        .then((value) {
      print("Item Deleted");
    }).catchError((error) {
      print("Can't Delete item:" + error.toString());
    });
  }
}
