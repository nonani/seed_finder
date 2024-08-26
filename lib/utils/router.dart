import 'package:go_router/go_router.dart';
import 'package:seed_finder/pages/home_page.dart';
import 'package:seed_finder/pages/login_page.dart';
import 'package:seed_finder/providers/is_signed_in_provider.dart';
import 'package:seed_finder/utils/logger.dart';


Future<GoRouter> createRouter() async {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
      ),
    ],
    // initialLocation: loggedIn ? "/home" : "/",
  );
}
