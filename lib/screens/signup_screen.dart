import 'package:flutter/material.dart';
import 'package:loja_virtual_upis/models/user_model.dart';

import 'package:scoped_model/scoped_model.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastro de Conta"),
          centerTitle: true,
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
                    controller: _nameController,
                    decoration: InputDecoration(hintText: "Nome Completo"),
                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty )
                        return "Nome inválido ! ";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "E-mail"
                    ),
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
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(hintText: "Endereço"),

                    // ignore: missing_return
                    validator: (text){
                      if(text.isEmpty )
                        return "Endereço Inválido ! ";
                    },
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

                              Map<String, dynamic> userData = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "address": _addressController.text
                              };

                              model.signUp(userData: userData, pass: _passController.text, onSuccess: _onSuccess, onFail: _onFail);
                            }
                          },
                          child: Text(
                            "Criar Conta",
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
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Usuario criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("falha ao criar usuario!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
    }

  }







