import 'dart:convert';

import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:chacalli_dictionary/utils/ChacalliColors.dart';
import 'package:chacalli_dictionary/widgets/EntryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryScreen extends StatefulWidget {
  final String entryId;

  const EntryScreen({super.key, required this.entryId});

  @override
  State<StatefulWidget> createState() => _EntryScreenState();

  static String get path => "/entry";
  static String get name => "/entry";
}

class _EntryScreenState extends State<EntryScreen> {
  Entry? entry;

  Future<void> loadEntries() async {
    final String entriesJsonString =
        await rootBundle.loadString('assets/chacalli.json');
    List<Entry> foundEntries = jsonDecode(entriesJsonString)
        .map<Entry>((element) => Entry.fromJson(element))
        .toList();
    setState(() {
      entry = foundEntries
          .firstWhere((element) => element.id == int.parse(widget.entryId));
    });
  }

  @override
  void initState() {
    super.initState();
    loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ChacalliColors.altText,
        title: Text(
          entry?.word ?? "loading...",
          style: GoogleFonts.newsreader(
              color: ChacalliColors.altText, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ChacalliColors.thematic,
        centerTitle: true,
      ),
      backgroundColor: ChacalliColors.background,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: entry != null
            ? Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ChacalliColors.surface,
                      border: Border.all(color: ChacalliColors.text),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry!.word,
                          style: GoogleFonts.newsreader(
                            color: ChacalliColors.text,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          entry!.pronunciation.replaceAll("-", "·"),
                          style: GoogleFonts.courierPrime(
                            color: ChacalliColors.text,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          entry!.meaning,
                          style: GoogleFonts.notoKufiArabic(
                              color: ChacalliColors.text, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
