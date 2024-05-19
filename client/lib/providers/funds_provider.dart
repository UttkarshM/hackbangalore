import 'package:client/models/fund.dart';
import 'package:riverpod/riverpod.dart';

class FundsNotifier extends StateNotifier<List<dynamic>> {
  FundsNotifier()
      : super([]);

  addFunds(dynamic fundOption) {
    state = [...state, fundOption];
  }
}

final fundsProvider =
    StateNotifierProvider<FundsNotifier, List<dynamic>>((ref) => FundsNotifier());
