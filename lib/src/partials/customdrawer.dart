import 'package:flutter/material.dart';

Widget CustomDrawer( {required BuildContext pageContext}){


  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget> [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(
                    'DevsTravel',
                    style: TextStyle(
                     color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue'
                  ),),
                  Text(
                    'versao 1.0',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Helvetica Neue'
                    ),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
            ),
             ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text('Home'),
                onTap: (){
                  Navigator.pushReplacementNamed(pageContext, '/home');
                },
          ),
            ListTile(
              leading: Icon(Icons.public, color: Colors.black),
              title: Text('Escollher Continente'),
              onTap: (){
                Navigator.pushReplacementNamed(pageContext, '/continent');
              },
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.black),
              title: Text('Buscar Cidade'),
              onTap: (){
                Navigator.pushReplacementNamed(pageContext, '/search');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.black),
              title: Text('Cidades Salvas'),
              onTap: (){
                Navigator.pushReplacementNamed(pageContext, '/favorites');
              },
            ),
      ],
    ),
  );


}