import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
//import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:chacalli_dictionary/services/DatabaseService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

  static String get path => "/home";
  static String get name => "/home";
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await DatabaseService.initialize(); });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Chacalli Dictionary',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}