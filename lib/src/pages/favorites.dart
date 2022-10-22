import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class FavoritesPage extends StatelessWidget{

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context){
    return Consumer<AppData>(
        builder: (ctx, appdata, child) {

          List favorites = appdata.favoritesCities();

            return Scaffold(
              key: _scaffoldkey,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: CustomAppBar(
                  scaffoldKey: _scaffoldkey,
                  title: 'Cidades Salvas',
                  pageContext: context,


                ),
              ),
              drawer: CustomDrawer(
                  pageContext: context
              ),
              backgroundColor: Colors.white,
              body: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,

                children: List.generate(favorites.length, (index){
                  return CityBox(
                    data: favorites[index],
                    onTap: (cityData){
                      Navigator.pushNamed(context, '/city', arguments: cityData);
                    },
                  );
                }),
              )
            );
        }
    );
  }
}