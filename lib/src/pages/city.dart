
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context){

    Map<String, dynamic> cityData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
   // print(cityData!['places']);

    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldkey,
          drawer: CustomDrawer(
              pageContext: context,
            ),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget> [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                     color: Colors.red
                  ),
                ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top:statusBarHeight),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () {  },
                ),
              )
            ],
          )
        )
    );
  }
}