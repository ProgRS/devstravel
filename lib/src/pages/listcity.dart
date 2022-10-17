import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  void cityBoxAction(pageContext, cityData){
     print(cityData['name']);
     Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }
  @override
  Widget build(BuildContext context){
    final continentIndex = ModalRoute.of(context)?.settings.arguments  ;

    return Consumer<AppData>(
        builder: (ctx, appdata, child){
          var cities = [];
          for(var country in appdata.data[continentIndex as int]['countries']){
             cities.addAll(country['cities']);
          }
          return Scaffold(
            key: _scaffoldkey,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                  scaffoldKey: _scaffoldkey,
                  pageContext: context,
                  title: "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
                  showBack: true


              ),
            ),
            drawer: CustomDrawer(
                pageContext: context
            ),
            backgroundColor: Colors.white,
            body: GridView.count(
                crossAxisCount:3,
                children: List.generate(cities.length, (index) {
                      return CityBox(data: cities[index],
                          onTap: (cityData){
                             cityBoxAction(context, cityData);
                          }
                      );
                } ),
            ),
            
          );
        }
    );
  }
}