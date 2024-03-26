import 'package:task_intern_5_flutter/import.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Status.getLoginStatus(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.data!) {
            return const DashboardPage(); 
          } else {
            return const LoginPage(); 
          }
        }
      },
    );
  }
}
