import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:chacalli_dictionary/screens/EntryScreen.dart';
import 'package:chacalli_dictionary/utils/ChacalliColors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryCard extends StatelessWidget {
  final Entry entry;

  const EntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        EntryScreen.path,
        extra: entry.id,
      ),
      child: Container(
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
              entry.word,
              style: GoogleFonts.newsreader(
                color: ChacalliColors.text,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              entry.pronunciation.replaceAll("-", "·"),
              style: GoogleFonts.courierPrime(
                color: ChacalliColors.text,
                fontSize: 12,
              ),
            ),
            Text(
              entry.meaning,
              style: GoogleFonts.notoKufiArabic(
                  color: ChacalliColors.text, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
