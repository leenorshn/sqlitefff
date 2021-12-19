import 'package:flutter/material.dart';
import 'package:sqlitefff/api/contact_api.dart';
import 'package:sqlitefff/main_page.dart';
import 'package:sqlitefff/new_contact.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContactApi().initDb();
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
        primarySwatch: Colors.orange,
      ),
      home: const MainPage(),
      routes: {"new_contact": (context) => const NewContact()},
    );
  }
}
