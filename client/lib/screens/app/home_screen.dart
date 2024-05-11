import 'package:client/models/raise_fund.dart';
import 'package:client/themes/colors.dart';
import 'package:client/widgets/fund_option.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  AppColors colors = AppColors();
  RaiseFund fund = const RaiseFund(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQimUsgNF01EfMgLJIuxLSPa-PAr1_6pswfPBr8Hcr_1g&s',
      title: 'Help this poor man',
      description: 'He got abandoned',
      location: 'Bangalore',
      timeLeft: '8',
      fundsNeeded: 10000,
      fundsRaised: 5000);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: colors.l2,
            size: width * 0.08,
          ),
        ),
        backgroundColor: colors.d1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: colors.l2),
            iconSize: width * 0.08,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.d2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Donate',
                      style: TextStyle(color: colors.l2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.d2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Raise Funding',
                      style: TextStyle(color: colors.l2),
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(height * 0.005),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => FundOption(fundDetails: fund,),
                  separatorBuilder: ((context, index) => Padding(
                        padding: EdgeInsets.only(top: width * 0.01),
                      )),
                  itemCount: 10)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colors.l2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Fundraiser',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Scan',
          )
        ],
      ),
    );
  }
}
