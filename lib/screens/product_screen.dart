import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_upis/datas/cart_product.dart';
import 'package:loja_virtual_upis/datas/product_data.dart';
import 'package:loja_virtual_upis/models/cart_model.dart';
import 'package:loja_virtual_upis/models/user_model.dart';

import 'cart_screen.dart';
import 'login_screen.dart';


class ProductScreen extends StatefulWidget {

  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;

  String types;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.image.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 161, 4)
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                SizedBox(
                  height: 20.0,

                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: (){
                      if(UserModel.of(context).isLoggedIn()){

                        CartProduct cartProduct = CartProduct();
                        cartProduct.types =  types;
                        cartProduct.quantity = 1;
                        cartProduct.pid = product.id;
                        cartProduct.category = product.category;
                        cartProduct.productData = product;

                        //adicionar ao carrinho
                        CartModel.of(context).addCartItem(cartProduct);

                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> CartScreen())
                        );

                      }else{
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> LoginScreen())
                        );
                      }
                      },
                    style: ElevatedButton.styleFrom(onPrimary: Color.fromARGB(
                        255, 255, 255, 255),primary: Colors.black),
                    child: Text(
                        UserModel.of(context).isLoggedIn() ?
                      "Adicionar ao Carrinho" : "Entre para comprar",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),



              ],
            ),
          )
        ],
      ),
    );
  }
}
