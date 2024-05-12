import 'package:client/models/fund.dart';
import 'package:client/providers/funds_provider.dart';
import 'package:client/providers/my_funds_provider.dart';
import 'package:client/screens/app/chatbot_screen.dart';
import 'package:client/themes/colors.dart';
import 'package:client/widgets/fund_option.dart';
import 'package:client/screens/app/raise_fund_screen.dart';
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

    List<Fund> fundsList = ref.watch(fundsProvider);

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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(height * 0.005),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        FundOption(fundDetails: fundsList[index], idx: index),
                    separatorBuilder: ((context, index) => Padding(
                          padding: EdgeInsets.only(top: width * 0.01),
                        )),
                    itemCount: fundsList.length))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colors.d2,
        unselectedItemColor: colors.l1,
        backgroundColor: colors.l2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Fundraiser',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chatbot',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RaiseFundScreen()));
              break;
            case 2:
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
              break;
          }
        },
      ),
    );
  }
}
