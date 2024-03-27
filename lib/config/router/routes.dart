import 'package:task_intern_5_flutter/import.dart';

class MyRoute {
  Route onRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const InitialPage(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case RouteName.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        );

      case RouteName.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
