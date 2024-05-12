import 'package:client/screens/app/home_screen.dart';
import 'package:client/screens/auth/login_screen.dart';
import 'package:client/screens/auth/signup_screen.dart';
import 'package:client/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gap(height * 0.01),
            const Text(
              'join the world of crowdfunding',
              style: TextStyle(color: Colors.white),
            ),
            Gap(height * 0.1),
            SvgPicture.asset(
              'assets/welcome.svg',
              height: height * 0.3,
            ),
            Gap(height * 0.1),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    fixedSize: MaterialStatePropertyAll(
                      Size(width * 0.7, height * 0.06),
                    ),
                  ),
              child: const Text('Login'),
            ),
            Gap(height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  },
                  child: const Text(
                    'Sign Up!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
