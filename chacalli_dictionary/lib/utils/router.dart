import 'package:go_router/go_router.dart';
import 'package:chacalli_dictionary/screens/HomeScreen.dart';
import 'package:chacalli_dictionary/screens/EntryScreen.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: HomeScreen.path,
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: EntryScreen.path,
      name: EntryScreen.name,
      builder: (context, state) {
        print(state.extra);
        return EntryScreen(entryId: "${state.extra as int}");
      }),
]);
