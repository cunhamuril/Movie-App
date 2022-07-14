import 'package:flutter/material.dart';
import 'package:movie_app/http/clients/genre_client.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_page.dart';
import 'package:movie_app/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: LightThemeColors.primaryColor,
        backgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        dividerColor: LightThemeColors.textLow,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: LightThemeColors.primaryColor),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: LightThemeColors.primaryColor),
          bodyText2: TextStyle(color: LightThemeColors.textLow),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        backgroundColor: DarkThemeColors.primaryColorAccent,
        scaffoldBackgroundColor: LightThemeColors.primaryColor,
        dividerColor: LightThemeColors.textLow,
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: DarkThemeColors.textLow),
        ),
      ),
      home: const HomePage(),
    );
  }
}
