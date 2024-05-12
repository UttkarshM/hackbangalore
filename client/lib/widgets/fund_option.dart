import 'package:client/models/fund.dart';
import 'package:client/screens/features/fund_details_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class FundOption extends StatelessWidget {
  final Fund fundDetails;
  final int idx;
  const FundOption({super.key, required this.fundDetails, required this.idx});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(fundDetails.fundsRaised / fundDetails.fundsNeeded);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FundDetailsScreen(index: idx))),
      child: Card(
        color: colors.d2,
        child: SizedBox(
          height: height * 0.5,
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        placeholder: 'assets/loading.png',
                        image:
                            fundDetails.imageUrl,
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
                            "${fundDetails.title}",
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
                            'Overview: ${fundDetails.description}',
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
                              '${fundDetails.timeLeft} left: ',
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
                        Gap(height * 0.02),
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
        ),
      ),
    );
  }
}
