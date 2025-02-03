import 'package:flutter/material.dart';
import 'package:chacalli_dictionary/utils/router.dart';

void main() {
  runApp(const ChacalliDictionary());
}

class ChacalliDictionary extends StatelessWidget {
  const ChacalliDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chacalli Dictionary Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}