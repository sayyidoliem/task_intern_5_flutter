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
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final api = LoginService();

  bool isVisible = false;

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    LoginCubit myLoginBloc = LoginCubit();
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300.0,
                    height: 300.0,
                    child: Image.asset('assets/login.jpg')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
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
                  child: TextFormField(
                    cursorRadius: const Radius.circular(24.0),
                    controller: _passwordController,
                    cursorColor: const Color.fromRGBO(36, 120, 129, 1),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          (!isVisible) ? isVisible = true : isVisible = false;
                          setState(() {});
                        },
                        icon: Icon(
                          (isVisible == true)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: const TextStyle(
                          color: Color.fromRGBO(36, 120, 129, 1)),
                      fillColor: const Color.fromRGBO(36, 120, 129, 0.200),
                    ),
                    obscureText: (!isVisible) ? false : true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 56.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(child: CircularProgressIndicator(color: Colors.amber,));
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_userNameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter your username'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                            if (_passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter your password'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                            myLoginBloc.onLoginSuccess(_userNameController.text,
                                _passwordController.text, context);

                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0.25,
                            backgroundColor: const Color.fromRGBO(36, 120, 129, 1),
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
