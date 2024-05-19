import 'package:client/providers/chosen_provider.dart';
import 'package:client/screens/auth/login_screen.dart';
import 'package:client/screens/welcome_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ChooseScreen extends ConsumerStatefulWidget {
  const ChooseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ChooseScreenState();
  }
}

class _ChooseScreenState extends ConsumerState<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AppColors colors = AppColors();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: -100,
              child: Container(
                height: height * 0.7,
                width: height * 0.7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(
                    255,
                    137,
                    22,
                    82,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                height: height * 0.4,
                width: height * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.l2,
                ),
              ),
            ),
            Positioned(
              top: height * 0.075,
              left: width * 0.2,
              child: SizedBox(
                width: width * 0.6,
                child: SvgPicture.asset('assets/community.svg'),
              ),
            ),
            Positioned(
                top: height * 0.65,
                left: width * 0.09,
                child: Container(
                  width: width * 0.84,
                  height: height * 0.26,
                  decoration: BoxDecoration(
                      color: colors.d2,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            child: Text(
                              'How do you wanna help the community?',
                              style: TextStyle(color: colors.l1),
                            ),
                          ),
                          Gap(height * 0.02),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                              ref.read(chosenProvider.notifier).state = true;
                              print(ref.read(chosenProvider.notifier).state);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.l1,
                              minimumSize: Size(width * 0.7, height * 0.06),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              'Start a free fundraiser',
                              style: TextStyle(color: colors.d1, fontSize: 16),
                            ),
                          ),
                          Gap(height * 0.02),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                              ref.read(chosenProvider.notifier).state = false;
                              print(ref.read(chosenProvider.notifier).state);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.l2,
                              minimumSize: Size(width * 0.7, height * 0.06),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Make a donation',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
