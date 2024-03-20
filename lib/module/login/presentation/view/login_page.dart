import 'package:task_intern_5_flutter/import.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyAPPS',
          style: TextStyle(
              color: Color.fromRGBO(36, 120, 129, 1),
              fontWeight: FontWeight.bold,
              fontSize: 34.0),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 300.0,
                height: 300.0,
                child: Image.asset('assets/login.jpg')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                cursorRadius: const Radius.circular(24.0),
                controller: _userNameController,
                cursorColor: const Color.fromRGBO(36, 120, 129, 1),
                decoration: const InputDecoration(
                    filled: true,
                    labelText: 'username',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(36, 120, 129, 1)),
                    fillColor: Color.fromRGBO(36, 120, 129, 0.200)),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                cursorRadius: const Radius.circular(24.0),
                controller: _passwordController,
                cursorColor: const Color.fromRGBO(36, 120, 129, 1),
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'password',
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility)),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle:
                        const TextStyle(color: Color.fromRGBO(36, 120, 129, 1)),
                    fillColor: const Color.fromRGBO(36, 120, 129, 0.200)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 56.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.dashboard);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(36, 120, 129, 1)),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
