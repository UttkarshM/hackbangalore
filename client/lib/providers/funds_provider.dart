import 'package:client/models/fund.dart';
import 'package:riverpod/riverpod.dart';

class FundsNotifier extends StateNotifier<List<Fund>> {
  FundsNotifier()
      : super([
          const Fund(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQimUsgNF01EfMgLJIuxLSPa-PAr1_6pswfPBr8Hcr_1g&s',
              title: 'Help this poor man',
              description: 'He got abandoned bbbbbbb',
              location: 'Bangalore',
              timeLeft: '8',
              fundsNeeded: 10000,
              fundsRaised: 5000)
        ]);

  addFunds(Fund fundOption) {
    state = [...state, fundOption];
  }
}

final fundsProvider =
    StateNotifierProvider<FundsNotifier, List<Fund>>((ref) => FundsNotifier());
