import 'package:client/models/raise_fund.dart';
import 'package:riverpod/riverpod.dart';

class FundsNotifier extends StateNotifier<List<RaiseFund>> {
  FundsNotifier() : super([]);

  addFunds(RaiseFund fundOption) {
    state = [...state, fundOption];
  }

}

final fundsProvider = StateNotifierProvider<FundsNotifier, List<RaiseFund>>(
    (ref) => FundsNotifier());
