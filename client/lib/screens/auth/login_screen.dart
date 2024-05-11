import 'package:client/screens/app/home_screen.dart';
import 'package:client/screens/auth/signup_screen.dart';
import 'package:client/screens/welcome_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  var emailId = TextEditingController();
  var password = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> loginUser() async {
    try {
      print(emailId.text);
      print(password.text);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailId.text, password: password.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logged in succesfully')));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    AppColors color = AppColors();

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
                Gap(height * 0.05),
                SvgPicture.asset(
                  'assets/login.svg',
                  height: height * 0.25,
                ),
                Gap(height * 0.1),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your Email Address',
                          labelStyle: TextStyle(color: color.d1),
                          prefixIcon: Icon(
                            Icons.email,
                            color: color.d1,
                          ),
                          filled: true,
                          fillColor: color.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailId,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          labelStyle: TextStyle(color: color.d1),
                          prefixIcon: Icon(
                            Icons.password,
                            color: color.d1,
                          ),
                          filled: true,
                          fillColor: color.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: password,
                      ),
                    ],
                  ),
                ),
                Gap(height * 0.015),
                ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color.l2,
                      minimumSize: Size(width * 0.85, height * 0.08),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // Gap(height * 0.01),
                // TextButton(
                //   onPressed: () => Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => WelcomeScreen()),
                //   ),
                //   child: const Text('Forgot Password'),
                // ),
                Gap(height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(color: color.l2),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: Text(
                        'Sign Up!',
                        style: TextStyle(color: color.l1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
