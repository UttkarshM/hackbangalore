import 'package:client/models/fund.dart';
import 'package:client/models/my_fund.dart';
import 'package:client/providers/chosen_provider.dart';
import 'package:client/providers/funds_provider.dart';
import 'package:client/providers/my_funds_provider.dart';
import 'package:client/screens/app/chatbot_screen.dart';
import 'package:client/screens/features/create_fund_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:client/widgets/fund_option.dart';
import 'package:client/screens/app/raise_fund_screen.dart';
import 'package:client/widgets/my_fund_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<dynamic> fundsList = ref.watch(fundsProvider);
    List<MyFund> myFundsList = ref.watch(myFundsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: !ref.watch(chosenProvider.notifier).state
            ? Text(
                'App',
                style: Theme.of(context).textTheme.titleLarge,
              )
            : Text(
                'My fundraisers',
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(height * 0.005),
            Expanded(
                child: !ref.watch(chosenProvider.notifier).state
                    ? ListView.separated(
                        itemBuilder: (context, index) => FundOption(
                            fundDetails: fundsList[index], idx: index),
                        separatorBuilder: ((context, index) => Padding(
                              padding: EdgeInsets.only(top: width * 0.01),
                            )),
                        itemCount: fundsList.length,
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => MyFundOption(
                            fundDetails: myFundsList[index], idx: index),
                        separatorBuilder: ((context, index) => Padding(
                              padding: EdgeInsets.only(top: width * 0.01),
                            )),
                        itemCount: myFundsList.length,
                      ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colors.l1,
        unselectedItemColor: colors.l1,
        backgroundColor: colors.d3,
        items: [
          if (!ref.watch(chosenProvider.notifier).state)
            const BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Donate',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Fundraiser',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chatbot',
          ),
        ],
        onTap: !ref.watch(chosenProvider.notifier).state
            ? (int index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                    break;
                  case 1:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RaiseFundScreen()));
                    break;
                  case 2:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
                    break;
                }
              }
            : (int index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateFundScreen()));
                    break;
                  case 1:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
                    break;
                }
              },
      ),
    );
  }
}
