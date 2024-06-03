import 'package:flutter/material.dart';
import 'screens/note_list.dart';
import 'db/db_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
