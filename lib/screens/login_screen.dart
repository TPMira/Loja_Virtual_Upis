import 'package:flutter/material.dart';
import 'package:loja_virtual_upis/models/user_model.dart';
import 'package:loja_virtual_upis/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            TextButton(
              child: Text(
                "Criar Conta",
                style: TextStyle(
                    fontSize: 15.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>SingUpScreen())
                );
              },
            )
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty || !text.contains("@"))
                        return "E-mail inválido ! ";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty || text.length < 6 )
                        return "Senha Inválida ! ";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if(_emailController.text.isEmpty)
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Insira seu email para recuperação"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 2),
                              )
                          );
                        else
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("confira seu email"),
                                backgroundColor: Theme.of(context).primaryColor,
                                duration: Duration(seconds: 2),
                              )
                          );
                      },
                      child: Text(
                        "Esqueceu a senha ? ",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                      height: 44.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Color.fromARGB(255, 255, 255, 255),
                              primary: Colors.black),
                          onPressed: () {
                            if(_formKey.currentState.validate()){

                            }

                            model.signIn(
                                email: _emailController.text,
                                pass: _passController.text,
                                OnSuccess: _onSuccess,
                                OnFail: _onFail
                            );
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )))
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("falha ao entrar !"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}



