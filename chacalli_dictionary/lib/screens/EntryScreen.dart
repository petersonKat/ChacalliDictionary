import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EntryScreenState();

  static String get path => "/entry";
  static String get name => "/entry";
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(body: SafeArea(child: Text("loading...")));
  }
}