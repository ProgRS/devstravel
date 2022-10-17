import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

import '../partials/citybox.dart';



class ContinentPage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  void seeCityAction(context,  continentIndex){
    //print(continentIndex);
    Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
  }

  void cityBoxAction(pageContex, cityData){

      Navigator.pushNamed(pageContex, '/city', arguments: cityData);

  }

  @override
  Widget build(BuildContext context){
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldkey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              scaffoldKey: _scaffoldkey,
              title: 'Escolha um continente',
              pageContext: context,
            ),
          ),
          drawer: CustomDrawer(
              pageContext: context
          ),
          backgroundColor: Colors.white,
          body: ListView.builder(
              itemCount: appdata.data.length,
              itemBuilder: (context, index){
                //appdata.data[index]['name']

                var cities = [] ;
                for(var country in appdata.data[index]['countries']){
                          cities.addAll(country['cities']);
                }
                return Column(
                  children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "${appdata.data[index]['name']} (${cities.length})",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Helvetica Neue'
                                  ),
                                ),
                            ),
                              FlatButton(
                                  child:  Text(
                                      'Ver cidades',
                                  style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 13,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey
                                  ),
                                  ),
                                  onPressed: (){
                                    cityBoxAction(context, index);
                                  },
                              )
                        ],
                        ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(bottom: 15),
                      child: ListView.builder(

                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (cityContext, cityIndex){
                              return CityBox(
                                data: cities[cityIndex],
                                onTap: (cityData){
                                    cityBoxAction(context, cityData);
                                }
                              );

                        },
                      ),
                    )
                  ],
                );

              },
          )
        )
    );
  }
}