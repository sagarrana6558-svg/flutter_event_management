import 'dart:convert';
import 'package:flutter/material.dart';
import 'addevent.dart';
import 'firstscreen.dart';
import 'splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {
  _FragmentHolderState() {
    loadlist();
  }
  List<Map<String, dynamic>> data = [
    {"title": "Music Concert", "date": "20 May 2026", "location": "Ahmedabad"},
    {"title": "Tech Seminar", "date": "25 May 2026", "location": "Gandhinagar"},
    {"title": "College Fest", "date": "30 May 2026", "location": "Surat"},
  ];

  Future<void> savelist() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final String encodedData = jsonEncode(data);
      await sharedPreferences.setString('event_data', encodedData);
      print('Data saved successfully');
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  Future<void> loadlist() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final String encodedData =
          sharedPreferences.getString('event_data') ?? '[]';
      if (encodedData != '[]') {
        final List<dynamic> decodedData = jsonDecode(encodedData);
        setState(() {
          data = List<Map<String, dynamic>>.from(decodedData);
        });
        print('Data loaded successfully');
      } else {
        print('No data found');
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void deleteEvent(int index) {
    data.removeAt(index);
    setState(() {
      data = data;
    });
    savelist();
  }

  void editEvent(int index, Map<String, dynamic> updatedEvent) {
    data[index] = updatedEvent;
    setState(() {
      data = data;
    });
    savelist();
  }

  void addEvent(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add');
    if (result != null && result is Map<String, dynamic>) {
      data.add(result);
      setState(() {
        data = data;
      });
      savelist();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => SplashScreen();
              break;

            case '/home':
              builder = (BuildContext context) => EventScreen(
                data: data,
                deleteEvent: deleteEvent,
                editEvent: editEvent,
                addEvents: addEvent,
              );
              break;

            case '/update':
              builder = (BuildContext context) =>
                  AddEventScreen(event: (settings.arguments as Map)["event"]);
              break;

            case '/add':
              builder = (BuildContext context) => AddEventScreen();
              break;

            default:
              builder = (BuildContext context) =>
                  const Scaffold(body: Center(child: Text("Not Found!")));
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
