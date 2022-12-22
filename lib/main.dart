import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_manna_flutter/providers/checklist_provider.dart';
import 'package:today_manna_flutter/screens/manna_navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ChecklistProvider())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MannaNavigation(),
    );
  }
}
