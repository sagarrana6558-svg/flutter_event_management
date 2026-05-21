import 'package:flutter/material.dart';
//import 'Screen/splash.dart';
// import 'Screen/firstscreen.dart';
// import 'Screen/login.dart';
import 'Screen/fragment.dart';

void main() {
  runApp(const EventmanagerApp());
}

class EventmanagerApp extends StatefulWidget {
  const EventmanagerApp({super.key});

  @override
  State<EventmanagerApp> createState() => _EventmanagerAppState();
}

class _EventmanagerAppState extends State<EventmanagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FragmentHolder(),
    );
  }
}
