import 'dart:io';

import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DonationScreen extends ConsumerStatefulWidget {
  const DonationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DonationScreenState();
  }
}

class _DonationScreenState extends ConsumerState<DonationScreen> {
  var amountDeduction = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    AppColors colors = AppColors();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.d1,
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PAYMENT',
                    style: TextStyle(color: colors.l2, fontSize: 30),
                  ),
                ),
                Gap(height * 0.05),
                Card(
                  color: colors.l1,
                  child: Column(
                    children: [
                      Gap(height * 0.03),
                      Row(
                        children: [
                          Gap(height * 0.03),
                          Container(
                            height: height * 0.1,
                            width: height * 0.1,
                            decoration:const  BoxDecoration(
                                shape: BoxShape.circle,),
                            child: Image.network(
                              'https://wallpapers.com/images/hd/close-up-goku-ultra-instinct-n17m8udldpvuhsvm.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Gap(height * 0.03),
                          Text('Rishis wallet', style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      Gap(height * 0.03),
                      Container(
                        width: double.infinity,
                        color: colors.l2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Balance: Rs.2000',
                            style: TextStyle(color: colors.d1, fontSize: 30),
                          ),
                        ),
                      ),
                      Gap(height * 0.05),
                    ],
                  ),
                ),
                Gap(height * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter the amount',
                    labelStyle: TextStyle(color: colors.d1),
                    prefixIcon: Icon(
                      Icons.email,
                      color: colors.d1,
                    ),
                    filled: true,
                    fillColor: colors.l1,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Gap(height * 0.05),
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
                    'Checkout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Gap(height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Out of money? ',
                      style: TextStyle(color: colors.l1),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DonationScreen()));
                      },
                      child: Text(
                        'Topup',
                        style: TextStyle(color: colors.l2, fontSize: 22),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
