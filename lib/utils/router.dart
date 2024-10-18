import 'package:go_router/go_router.dart';
import 'package:seed_finder/pages/home_page.dart';
import 'package:seed_finder/pages/sign_in_page.dart';


Future<GoRouter> createRouter() async {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
      ),
    ],
    // initialLocation: loggedIn ? "/home" : "/",
  );
}
