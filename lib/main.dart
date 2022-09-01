import 'package:all_persistenses_types/nosql/listBook.dart';
import 'package:all_persistenses_types/screens/home.dart';
import 'package:all_persistenses_types/sqlite/listPerson.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: "/",
      routes: {
       "/" : (context) => const Home(),
       "/person" : (context) => const ListPerson(),
       "/book" : (context) => const ListBook(),
      },
    );
  }
}