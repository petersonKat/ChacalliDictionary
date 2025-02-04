import 'package:chacalli_dictionary/models/Entry.dart';
import 'package:chacalli_dictionary/utils/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService();

  static DatabaseService get instance => _instance;
  
  static const String DICTIONARY_ENTRIES = 'entries';
  late final Box<Entry> _entryBox;

  Future<void> openBoxes() async {
    _entryBox = await Hive.openBox<Entry>(DICTIONARY_ENTRIES);
  }

  static Future<void> initialize() async {
    try {
      await Hive.initFlutter();

      Logger.info("Initializing... started Hive!");

      Hive.registerAdapter(EntryAdapter());

       Logger.info("Initializing... adapters registered!");
      try {
        await DatabaseService.instance.openBoxes();
      } catch (e) {
        Logger.warn("Initializing Error opening boxes. $e");
        rethrow;
      }

      Logger.info("Initializing... boxes opened!");
      Logger.info(
          "Number of Entries: ${DatabaseService.instance._entryBox.values.length}");

    } catch (e) {
      Logger.warn("Initializing Error, miscellaneous. $e");
    }
  }

  // AVOIDING ERRORS
  static bool checkBoxes() {
    return DatabaseService.instance._entryBox.isOpen;
  }
}