import 'dart:io';

import 'package:client/models/fund.dart';
import 'package:client/models/my_fund.dart';
import 'package:client/providers/funds_provider.dart';
import 'package:client/providers/my_funds_provider.dart';
import 'package:client/screens/transactions/donation_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MyFundDetailsScreen extends ConsumerStatefulWidget {
  final int index;
  const MyFundDetailsScreen({super.key, required this.index});

  @override
  ConsumerState<MyFundDetailsScreen> createState() {
    return _MyFundDetailsScreenState();
  }
}

class _MyFundDetailsScreenState extends ConsumerState<MyFundDetailsScreen> {
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    List<MyFund> myFundsList = ref.watch(myFundsProvider);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: colors.d1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${myFundsList[widget.index].title}',
                      style: TextStyle(color: colors.l1, fontSize: 24),
                    ),
                  ),
                  Gap(height*0.005),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hosted by ',
                            style: TextStyle(color: colors.l2),
                          ), 
                          TextSpan(text: myFundsList[widget.index].hostedBy, style: TextStyle(color: colors.l1, ))
                        ],
                      ),
                    ),
                    // child: Text(
                    //   'hosted by ${myFundsList[widget.index].title}',
                    //   style: TextStyle(color: colors.l1, fontSize: 16),
                    // ),
                  ),
                  Gap(height*0.01),
                  SizedBox(
                    height: height * 0.3,
                    width: double.infinity,
                    child: Image.file(File(myFundsList[widget.index].image!.path), height: height * 0.3, width: height * 0.3,)
                  ),
                  Gap(height*0.01),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Overview: ',
                            style: TextStyle(color: colors.l2, fontSize: 16),
                          ), 
                          TextSpan(text: myFundsList[widget.index].description, style: TextStyle(color: colors.l1, fontSize: 16))
                        ],
                      ),
                    ),
                    // child: Text(
                    //   'Overview: ${myFundsList[widget.index].description}',
                    //   style: TextStyle(color: colors.l1, fontSize: 16),
                    // ),
                  ),
                  Gap(height*0.01),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Location: ',
                            style: TextStyle(color: colors.l2, fontSize: 16),
                          ), 
                          TextSpan(text: myFundsList[widget.index].location, style: TextStyle(color: colors.l1, fontSize: 16))
                        ],
                      ),
                    ),
                    
                  ),
                   Gap(height*0.01),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Time Left: ',
                            style: TextStyle(color: colors.l2, fontSize: 16),
                          ), 
                          TextSpan(text: myFundsList[widget.index].timeLeft, style: TextStyle(color: colors.l1, fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                   Gap(height*0.01),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Funds Raised: ',
                            style: TextStyle(color: colors.l2, fontSize: 16),
                          ), 
                          TextSpan(text: myFundsList[widget.index].fundsRaised.toString(), style: TextStyle(color: colors.l1, fontSize: 16))
                        ],
                      ),
                    ),
                    
                  ),
                   Gap(height*0.01),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Funds Needed: ',
                            style: TextStyle(color: colors.l2, fontSize: 16),
                          ), 
                          TextSpan(text: myFundsList[widget.index].fundsNeeded.toString(), style: TextStyle(color: colors.l1, fontSize: 16))
                        ],
                      ),
                    ),
                    
                  ),
                  Gap(height * 0.01),
                  Container(
                    width: width * 0.6,
                    child: LinearProgressIndicator(
                      minHeight: width * 0.02,
                      value: myFundsList[widget.index].fundsRaised /
                          myFundsList[widget.index].fundsNeeded,
                      backgroundColor: colors.l1,
                      valueColor: AlwaysStoppedAnimation<Color>(colors.l2),
                    ),
                  ),
                  Gap(height * 0.015),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DonationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.l2,
                        minimumSize: Size(width * 0.85, height * 0.08),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Donate',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
