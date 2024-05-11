import 'package:client/themes/colors.dart';
import 'package:client/widgets/donate_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  AppColors colors = AppColors();

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
        backgroundColor: colors.d1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: colors.l2),
            iconSize: width * 0.08,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => const DonateItem(),
                    separatorBuilder: ((context, index) =>
                        Padding(padding: EdgeInsets.only(top: width * 0.01))),
                    itemCount: 10))
          ],
        ),
      ),
    );
  }
}
