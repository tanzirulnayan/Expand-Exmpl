import 'package:expand_exmpl/details_page.dart';
import 'package:expand_exmpl/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expanded Container Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          DetailsPage.routeName: (ctx) => const DetailsPage(),
        });
  }
}
