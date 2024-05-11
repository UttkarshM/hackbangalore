import 'package:client/models/raise_fund.dart';
import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  borderRadius: BorderRadius.only(
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
                    Text(
                      fundDetails.title,
                      style: TextStyle(color: colors.l1),
                    ),
                    Text(
                      fundDetails.description,
                      style: TextStyle(color: colors.l1),
                    ),
                    Text(fundDetails.location),
                    Text('Last Donation ${fundDetails.timeLeft} hrs ago'),
                    Container(
                      width: width*0.8,
                      child: LinearProgressIndicator(
                        minHeight: width*0.02,
                        value: fundDetails.fundsRaised / fundDetails.fundsNeeded,
                        backgroundColor: colors.l1,
                        valueColor: AlwaysStoppedAnimation<Color>(colors.l2),
                      ),
                    ),
                    Text(
                        '${fundDetails.fundsRaised} raised of ${fundDetails.fundsNeeded}')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
