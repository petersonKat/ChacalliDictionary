import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
//import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:chacalli_dictionary/services/DatabaseService.dart';
import 'package:chacalli_dictionary/utils/logger.dart';
import 'package:chacalli_dictionary/screens/HomeScreen.dart';

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InitializationScreenState();

  static String get path => "/";
  static String get name => "/";
}

class _InitializationScreenState extends State<InitializationScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await DatabaseService.initialize();
      if (DatabaseService.checkBoxes() && context.mounted) {
        context.goNamed(HomeScreen.name);
      } else {
        Logger.warn(
            "ERROR! Something went wrong in the post-initialize() method.");
      }
    });

    return const Scaffold(body: SafeArea(child: Text("loading...")));
  }
}