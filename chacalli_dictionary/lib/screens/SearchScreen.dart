import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();

  static String get path => "/search";
  static String get name => "/search";
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(body: SafeArea(child: Text("loading...")));
  }
}