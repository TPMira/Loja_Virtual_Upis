import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual_upis/datas/product_data.dart';

class CartProduct {

  String cid;

  String category;
  String pid;

  int quantity;
  String  types;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    types = document.data["type"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "types": types,
      "product": productData.toResumeMap()
    };
  }

}