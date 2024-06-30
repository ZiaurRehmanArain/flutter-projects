import 'package:flutter/material.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:noteapp/pages/note_page.dart';
import 'package:noteapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await NoteDatabase.initailize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>NoteDatabase(),),
      ChangeNotifierProvider(create: (_)=>ThemeProvider())
    ],
  child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
home: const NotePage(),
  );}
}