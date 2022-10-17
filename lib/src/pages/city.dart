
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

  void backButtonAction(pageContext){
    Navigator.pop(pageContext);
  }

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
              Positioned(
                  top: 0,
                   left: 0,
                   right: 0,
                   height: 250,
                   child: Image.network(
                     cityData['places'][0]['img'],
                     fit: BoxFit.cover,
                   ),
              ),


              ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                     Container(
                       margin: EdgeInsets.only(top: 220),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(20)
                         ),
                       child: Column(
                                children: < Widget >[
                                  Row(children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(cityData['name'], style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text('Estrelinhas')
                                          ],
                                        ),
                                    Text('...')
                                  ],)
                                ],
                       ),
                     ),
                ],
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top:statusBarHeight),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: (){
                    backButtonAction(context);
                  },
                ),
              ),
            ],
          )
        )
    );
  }
}