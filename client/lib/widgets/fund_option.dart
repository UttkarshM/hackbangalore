import 'package:client/models/raise_fund.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class FundOption extends StatelessWidget {
  final RaiseFund fundDetails;
  const FundOption({super.key, required this.fundDetails});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    int raised = 989;
    int target = 1000;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(fundDetails.fundsRaised / fundDetails.fundsNeeded);
    return Card(
      color: colors.d2,
      child: SizedBox(
        height: height * 0.5,
        width: width * 0.7,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/login.svg',
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQimUsgNF01EfMgLJIuxLSPa-PAr1_6pswfPBr8Hcr_1g&s',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 5, left: 6),
                      child: Text(
                        "${fundDetails.title} :",
                        style: TextStyle(
                            color: colors.l1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: height * 0.079),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 5, left: 6),
                      child: Text(
                        'Here`s the full story: ${fundDetails.description}',
                        style: TextStyle(color: colors.l1),
                      ),
                    ),
                    Gap(width * 0.01),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colors.l2,
                        ),
                        Gap(width * 0.006),
                        Text(
                          fundDetails.location,
                          style: TextStyle(color: colors.l2),
                        ),
                      ],
                    ),
                    Gap(height * 0.006),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${fundDetails.timeLeft} DAYS LEFT: ',
                          style: TextStyle(
                              color: colors.l1,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Container(
                          width: width * 0.6,
                          child: LinearProgressIndicator(
                            minHeight: width * 0.02,
                            value: fundDetails.fundsRaised /
                                fundDetails.fundsNeeded,
                            backgroundColor: colors.l1,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(colors.l2),
                          ),
                        ),
                      ],
                    ),
                    Gap(height*0.02),
                    RichText(
                      text: TextSpan(
                          text: '${fundDetails.fundsRaised}/- ',
                          style: TextStyle(
                              color: colors.l1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'raised of ',
                                style: TextStyle(
                                    color: colors.l2,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20)),
                            TextSpan(
                              text: '${fundDetails.fundsNeeded}/- ',
                              style: TextStyle(
                                  color: colors.l1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
