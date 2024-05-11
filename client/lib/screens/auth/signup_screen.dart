import 'package:client/screens/app/home_screen.dart';
import 'package:client/screens/auth/login_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  AppColors colors = AppColors();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailId = TextEditingController();
  var password = TextEditingController();

  void signUpUser(BuildContext context) async {
    formKey.currentState!.validate();
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailId.text, password: password.text);
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created succesfully!')));
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

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: colors.l2),
                  ),
                ),
                Gap(height * 0.05),
                SvgPicture.asset(
                  'assets/signup.svg',
                  height: height * 0.25,
                ),
                Gap(height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your Email Address',
                          fillColor: colors.l1,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: colors.d1,
                          ),
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
                          prefixIcon: Icon(
                            Icons.password,
                            color: colors.d1,
                          ),
                          filled: true,
                          fillColor: colors.l1,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: password,
                      ),
                      Gap(height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm your password',
                          prefixIcon: Icon(
                            Icons.password,
                            color: colors.d1,
                          ),
                          fillColor: colors.l1,
                          filled: true,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {
                          if (value != password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Gap(height * 0.015),
                ElevatedButton(
                  onPressed: () => signUpUser(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors.l2,
                      minimumSize: Size(width * 0.85, height * 0.08),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Gap(height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: TextStyle(color: colors.l1),),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: Text('Login!', style: TextStyle(color: colors.l2),),
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
