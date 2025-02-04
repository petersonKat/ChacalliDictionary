import 'package:go_router/go_router.dart';
import 'package:chacalli_dictionary/screens/InitializationScreen.dart';
import 'package:chacalli_dictionary/screens/HomeScreen.dart';
import 'package:chacalli_dictionary/screens/SearchScreen.dart';
import 'package:chacalli_dictionary/screens/EntryScreen.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: InitializationScreen.path,
    name: InitializationScreen.name,
    builder: (context, state) => const InitializationScreen(),
  ),
  GoRoute(
    path: HomeScreen.path,
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: SearchScreen.path,
    name: SearchScreen.name,
    builder: (context, state) => const SearchScreen(),
  ),
  GoRoute(
    path: EntryScreen.path,
    name: EntryScreen.name,
    builder: (context, state) => const EntryScreen(),
  ),
]);