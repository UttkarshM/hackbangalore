import 'package:client/models/fund.dart';
import 'package:client/models/my_fund.dart';
import 'package:riverpod/riverpod.dart';

class MyFundsNotifier extends StateNotifier<List<MyFund>> {
  MyFundsNotifier() : super([]);

  void addFund(MyFund fundOption) {
    state = [...state, fundOption];
  }

  void removeFund(int index) {
    List<MyFund> tempList = state;
    tempList.removeAt(index);
    state = tempList;
  }
}

final myFundsProvider = StateNotifierProvider<MyFundsNotifier, List<MyFund>>(
    (ref) => MyFundsNotifier());
