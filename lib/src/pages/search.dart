import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class SearchPage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();



  @override
  Widget build(BuildContext context){
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldkey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              scaffoldKey: _scaffoldkey,
              title: 'Busque uma cidade',
              hideSearch: true,
              pageContext: context,


            ),
          ),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Text('Página de Busca...')
                ],
              )
          ),
        )
    );
  }
}