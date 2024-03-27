import 'package:task_intern_5_flutter/import.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FToast fToast;

  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();

  final user = UserStorage.getUser();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  //TODO remove unused parameter
  //done

  bool isVisible = true;

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    //TODO no needed this anymore after using context.read()
    //done
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
                  // TODO Add typography for textfield
                  //done
                  child: TextFormField(
                    cursorRadius: const Radius.circular(24.0),
                    controller: _userNameController,
                    cursorColor: const Color.fromRGBO(36, 120, 129, 1),
                    decoration: const InputDecoration(
                        filled: true,
                        labelText: 'username',
                        labelStyle: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
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
                  // TODO Add typography for textfield
                  //done
                  child: TextFormField(
                    cursorRadius: const Radius.circular(24.0),
                    controller: _passwordController,
                    cursorColor: const Color.fromRGBO(36, 120, 129, 1),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'password',
                      labelStyle: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w400),
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
                // TODO use sizedbox for spacing between widgets
                //done
                const SizedBox(height: 56.0),
                //* Other method using BlocListener
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      showDialog(
                        context: context,
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is LoginSuccess) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    }
                    if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error Login'),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0.25,
                        backgroundColor: const Color.fromRGBO(36, 120, 129, 1),
                      ),
                      onPressed: () {
                        context.read<LoginCubit>().onLoginSuccess(
                            _userNameController.text,
                            _passwordController.text,
                            context);
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 322.0,
                //   height: 56.0,
                //   child: BlocBuilder<LoginCubit, LoginState>(
                //     builder: (context, state) {
                //       if (state is LoginLoading) {
                //         return const Center(
                //             child: CircularProgressIndicator(
                //           color: Colors.amber,
                //         ));
                //       }
                //       //TODO fix the button size, see the figma again
                //       //done
                //       return ElevatedButton(
                //         onPressed: () {
                //           if (_userNameController.text.isEmpty) {
                //             //TODO Use toast package for showing the error
                //             //done
                //             fToast.showToast(
                //               child: const ToastContent(message: 'Username'),
                //               gravity: ToastGravity.CENTER,
                //               toastDuration: const Duration(seconds: 2),
                //             );
                //           } else if (_passwordController.text.isEmpty) {
                //             //TODO Use toast package for showing the error
                //             //done
                //             fToast.showToast(
                //               child: const ToastContent(message: 'Password'),
                //               gravity: ToastGravity.CENTER,
                //               toastDuration: const Duration(seconds: 2),
                //             );
                //           }

                //           // TODO use context.read()
                //           //done
                //           context.read<LoginCubit>().onLoginSuccess(
                //               _userNameController.text,
                //               _passwordController.text,
                //               context);

                //           //TODO no needed setState anymore
                //           //done
                //         },
                //         style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8)),
                //           elevation: 0.25,
                //           backgroundColor:
                //               const Color.fromRGBO(36, 120, 129, 1),
                //         ),
                //         child: const Text(
                //           "LOGIN",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
