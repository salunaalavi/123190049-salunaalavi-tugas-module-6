import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_module_6/layouts/bottom_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences userdata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    userdata = await SharedPreferences.getInstance();
    newUser = (userdata.getBool('status') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Navbar()));
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            const Text(
              "Login Form",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                if (username != '' && password != '') {
                  print("Success");
                  userdata.setBool('status', false);
                  userdata.setString('username', username);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Navbar()));
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
