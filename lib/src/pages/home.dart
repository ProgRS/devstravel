import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class HomePage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

    @override
    Widget build(BuildContext context){
      return Consumer<AppData>(
          builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldkey,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                scaffoldKey: _scaffoldkey,
                title: 'Pagina Home',
                pageContext: context,
                

              ),
            ),
            drawer: CustomDrawer(
               pageContext: context
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text('Bem vindo(a) ao', style: styles,),
                      ),
                  Image.asset('lib/assets/devstravel_logo.png',
                   width: 200,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text('Seu guia de viagem perfeito', style: styles,),
                  )
                ],
              )
            ),
          )
      );
    }
}