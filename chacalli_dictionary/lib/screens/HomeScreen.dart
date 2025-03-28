import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:chacalli_dictionary/models/Entry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

  static String get path => "/";
  static String get name => "/";
}

class _HomeScreenState extends State<HomeScreen> {
  //loads json file
  var jsonData; 
  Future<void> loadJsonAsset() async { 
    final String jsonString = await rootBundle.loadString('assets/chacalli.json'); 
    var data = jsonDecode(jsonString); 
    setState(() { 
      jsonData = data; 
    }); 
  } 
  
  @override 
  void initState() { 
    super.initState(); 
    loadJsonAsset(); 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Chacalli Dictionary',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      //This is bad, but should be where entry info can go. Verified loading
      body: Center( 
            child: jsonData != null 
                ? Column( 
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [Text(jsonData[7]["chacalli_word"])], 
                  ) 
                : CircularProgressIndicator()
                ), 
    );
  }
}