import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderScreen extends StatelessWidget {

  final String orderId;

  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pedido Realizado"
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80.0,
            ),
            Text("Pedido realizado com sucesso \n",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0
            ),
            ),
            SelectableText("Codigo do pedido:  $orderId \n",
            style: TextStyle(fontSize: 18.0),
            ),
            SelectableText("Para fazer o pagamento: \n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
            SelectableText("1) Copie a chave do Pix: SHDFGASDSA ",
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            SelectableText("2) Faça a trasferência do Pixs do seu banco.",
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            SelectableText("e Envie o comprovante do pagamento ",
              style: TextStyle(
                  fontSize: 16.0
              ),
            ),
            new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'AQUI',
                    style: new TextStyle(color: Colors.blue),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () { launch('https://api.whatsapp.com/send?phone=556192708303&text=Ola, tudo bem ?  o codigo do pedido é : (${orderId.substring(orderId.length -6, orderId.length)}) e vou enviar o comprovante do pagamento a seguir.');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
