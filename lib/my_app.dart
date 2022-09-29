import 'package:api/Pages/Home_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación de Gifs',
      initialRoute: '/',
      routes: {
        '/':(BuildContext context)=>MyHomeApp(title: 'Aplicación de Gifs')
      },
    );
  }
}