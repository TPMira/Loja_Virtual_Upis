import 'package:flutter/material.dart';
import 'package:loja_virtual_upis/models/user_model.dart';
import 'package:loja_virtual_upis/screens/login_screen.dart';
import 'package:loja_virtual_upis/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 11, 92, 232),
                Color.fromARGB(237, 80, 168, 208)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 38.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Upis",
                        style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)

                        ),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 255, 255)

                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn() ?
                                    "Entre ou cadastre-se" : "Sair",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: (){
                                    if(!model.isLoggedIn())
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>LoginScreen())
                                      );
                                    else
                                      model.signOut();
                                  },
                                )
                              ],
                            );
                          },
                        )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos",pageController, 3),
            ],
          ),
          Positioned(
            top: 450.0,
            left: 32.0,
            child: Text(
              "Desenvolvido por :",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)

              ),
            ),
          ),
          Positioned(
            top: 470.0,
            left: 54.0,
            child: Text(
              "Instagram : Thiago__Mira ",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
          ),
          Positioned(
            top: 485.0,
            left: 54.0,
            child: Text(
              "Diego Alves",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)
             ),
             ),
          ),
          Positioned(
            top: 500.0,
            left: 54.0,
            child: Text(
              "Pedro Lucas",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
          ),
          Positioned(
            top: 515.0,
            left: 54.0,
            child: Text(
              "Pedro Henrique",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
          ),
          Positioned(
            top: 530.0,
            left: 54.0,
            child: Text(
              "Egon",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
          ),
        ],
      ),
    );

  }
}
