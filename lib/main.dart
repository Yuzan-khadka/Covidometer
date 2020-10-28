import 'package:covidometer/screens/home_screen.dart';
import 'package:covidometer/services/country_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryName(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(accentColor: Colors.pinkAccent),
        home: HomeScreen(),
      ),
    );
  }
}
