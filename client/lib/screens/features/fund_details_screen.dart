import 'package:client/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Center(child: Column(),),
    );
  }
}
