import 'package:flutter/material.dart';
import 'package:loja_virtual_upis/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {

  final VoidCallback buy;

  CartPrice(this.buy);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model){

            double price = model.getProductsPrice();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Resumo do pedido",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text("R\$ ${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 161, 4),
                      fontSize: 16.0,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 12.0,),
                ElevatedButton(
                  onPressed: buy,
                  child: Text("Finalizar Pedido"),
                  style: ElevatedButton.styleFrom(onPrimary: Color.fromARGB(
                      255, 255, 255, 255),primary: Colors.black),
                )

              ],
            );
          },
        ),
      ),
    );
  }
}
