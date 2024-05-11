import 'package:client/models/fund.dart';
import 'package:riverpod/riverpod.dart';

class FundsNotifier extends StateNotifier<List<Fund>> {
  FundsNotifier() : super([]);

  addFunds(Fund fundOption) {
    state = [...state, fundOption];
  }

}

final fundsProvider = StateNotifierProvider<FundsNotifier, List<Fund>>(
    (ref) => FundsNotifier());
