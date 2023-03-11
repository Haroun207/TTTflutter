import 'package:flutter/material.dart';
import 'package:flutter07_tictactoe/game_screen.dart';
import './home_screen.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: const MaterialColor(0xff610094, {
            50: Color.fromRGBO(97, 00, 148, .1),
            100: Color.fromRGBO(97, 00, 148, .2),
            200: Color.fromRGBO(97, 00, 148, .3),
            300: Color.fromRGBO(97, 00, 148, .4),
            400: Color.fromRGBO(97, 00, 148, .5),
            500: Color.fromRGBO(97, 00, 148, .6),
            600: Color.fromRGBO(97, 00, 148, .7),
            700: Color.fromRGBO(97, 00, 148, .8),
            800: Color.fromRGBO(97, 00, 148, .9),
            900: Color.fromRGBO(97, 00, 148, 1),
          }),
          textTheme: TextTheme(
            titleMedium: GoogleFonts.libreBaskerville(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            titleSmall: GoogleFonts.robotoCondensed(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
      
      routes: {
        '/':(context)=>MyHome(),
        GameScreen.routeName:((context) => GameScreen()),
      },
    );
  }
}
