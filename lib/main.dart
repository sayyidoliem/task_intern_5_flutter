import 'package:task_intern_5_flutter/import.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = MyRoute();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(DashboardService()),
        ),
      ],
      child: MaterialApp(
        title: 'task_intern_5_flutter',
        theme: ThemeData(useMaterial3: true),
        initialRoute: RouteName.login,
        onGenerateRoute: router.onRoute,
      ),
    );
  }
}
