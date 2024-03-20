import 'package:task_intern_5_flutter/import.dart';
import 'package:task_intern_5_flutter/module/profile/presentation/view/profile_page.dart';

class MyRoute {
  Route onRoute(RouteSettings setting) {
    switch (setting.name) {
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
