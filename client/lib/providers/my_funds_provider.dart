import 'package:client/models/fund.dart';
import 'package:riverpod/riverpod.dart';

class MyFundsNotifier extends StateNotifier<List<Fund>> {
  MyFundsNotifier() : super([]);

  void addFund(Fund fundOption) {
    state = [...state, fundOption];
  }

  void removeFund(int index) {
    List<Fund> tempList = state;
    tempList.removeAt(index);
    state = tempList;
  }
}

final myFundsProvider = StateNotifierProvider<MyFundsNotifier, List<Fund>>(
    (ref) => MyFundsNotifier());
