import 'dart:math';

import 'package:chacalli_dictionary/utils/ChacalliColors.dart';
import 'package:chacalli_dictionary/widgets/EntryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

  static String get path => "/";
  static String get name => "/";
}

class _HomeScreenState extends State<HomeScreen> {
  List<Entry>? entries;
  List<Entry>? results;

  bool loading = true;
  bool initialLoad = false;

  TextEditingController searchTextController = TextEditingController();

  Future<void> loadEntries() async {
    final String entriesJsonString =
        await rootBundle.loadString('assets/chacalli.json');
    List<Entry> foundEntries = jsonDecode(entriesJsonString)
        .map<Entry>((element) => Entry.fromJson(element))
        .toList();
    setState(() {
      entries = foundEntries;
      results = tenRandomNumbers(foundEntries.length)
          .map<Entry>((element) => foundEntries[element])
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  List<int> tenRandomNumbers(int entriesLength) {
    List<int> toReturn = List<int>.empty(growable: true);
    while (toReturn.length < 10) {
      toReturn.add(Random.secure().nextInt(entriesLength));
    }
    return toReturn;
  }

  void updateResults(String? value) {
    print("UPDATE RESULTS $value");
    if (entries == null) {
      return;
    }

    setState(() {
      loading = true;
    });

    List<Entry> matchedWords = value != null
        ? entries!
            .where((element) => element.word.toLowerCase().contains(value))
            .toList()
        : [];

    List<Entry> matchedDefs = value != null
        ? entries!
            .where((element) => element.meaning.toLowerCase().contains(value))
            .toList()
        : [];

    if (matchedWords.length + matchedDefs.length == 0) {
      setState(
        () {
          results = tenRandomNumbers(entries!.length)
              .map<Entry>((element) => entries![element])
              .toList();
          loading = false;
        },
      );
    } else {
      setState(() {
        results = matchedWords + matchedDefs;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      if (!initialLoad) {
        setState(() {
          loading = true;
        });
        loadEntries();
        setState(() {
          loading = false;
          initialLoad = true;
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chacalli Dictionary',
          style: GoogleFonts.newsreader(
              color: ChacalliColors.altText, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ChacalliColors.thematic,
        centerTitle: true,
      ),
      backgroundColor: ChacalliColors.background,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView(
          children: loading
              ? [CircularProgressIndicator()]
              : <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                        controller: searchTextController,
                        onChanged: (value) => updateResults(value),
                        style: GoogleFonts.notoKufiArabic(
                            color: ChacalliColors.text, fontSize: 12),
                      ),
                    ),
                  ] +
                  results!
                      .map<EntryCard>(
                        (element) => EntryCard(entry: element),
                      )
                      .toList(),
        ),
      ),
    );
  }
}
