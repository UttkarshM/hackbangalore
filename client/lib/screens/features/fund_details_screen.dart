import 'package:client/models/fund.dart';
import 'package:client/providers/funds_provider.dart';
import 'package:client/screens/transactions/donation_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class FundDetailsScreen extends ConsumerStatefulWidget {
  final int index;
  const FundDetailsScreen({super.key, required this.index});

  @override
  ConsumerState<FundDetailsScreen> createState() {
    return _FundDetailsScreenState();
  }
}

class _FundDetailsScreenState extends ConsumerState<FundDetailsScreen> {
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    List<Fund> fundsList = ref.watch(fundsProvider);
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
            child: Card(
              color: colors.d2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Title: ${fundsList[widget.index].title}',
                        style: TextStyle(color: colors.l1, fontSize: 16),
                      ),
                    ),
                    
                    SizedBox(
                      height: height * 0.4,
                      width: double.infinity,
                      child: Image.network(fundsList[widget.index].imageUrl),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Title: ${fundsList[widget.index].title}',
                        style: TextStyle(color: colors.l1, fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                      'Description: ${fundsList[widget.index].description}',
                      style: TextStyle(color: colors.l1, fontSize: 16),
                    ),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                      'Location: ${fundsList[widget.index].location}',
                      style: TextStyle(color: colors.l1, fontSize: 16),
                    ),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                      'Time Left: ${fundsList[widget.index].timeLeft} days',
                      style: TextStyle(color: colors.l1, fontSize: 16),
                    ),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                      'Funds Raised: ${fundsList[widget.index].fundsRaised}',
                      style: TextStyle(color: colors.l1, fontSize: 16),
                    ),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                      'Funds Needed: ${fundsList[widget.index].fundsNeeded}',
                      style: TextStyle(color: colors.l1, fontSize: 16),
                    ),),
                    Gap(height * 0.1),
                    Container(
                      width: width * 0.6,
                      child: LinearProgressIndicator(
                        minHeight: width * 0.02,
                        value: fundsList[widget.index].fundsRaised /
                            fundsList[widget.index].fundsNeeded,
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
        ));
  }
}
