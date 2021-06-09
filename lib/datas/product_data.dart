import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;
  String title;
  String description;

  double price;

  List image;
  List types;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id =snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    image = snapshot.data["image"];
    types = snapshot.data["types"];

  }

  Map<String, dynamic> toResumeMap(){
    return{
      "title": title,
      "price": price
    };

  }

}