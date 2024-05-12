import 'package:client/models/fund.dart';
import 'package:riverpod/riverpod.dart';

class FundsNotifier extends StateNotifier<List<Fund>> {
  FundsNotifier()
      : super([
          const Fund(
              imageUrl:
                  'https://angelhack.com/wp-content/uploads/2024/03/hackbangalore_logo_white-1.png',
              title: 'All India Hackathon',
              description: 'Welcome to the next stop on our global journey: Bangalore! Get ready for an epic hackathon experience as The Global Hackathon Series makes its way to the vibrant tech hub of India. Join developers from around the city for 24 hours of non-stop coding, collaboration, and innovation. At hackbangalore, you’ll dive into a whirlwind of activity, with keynote speeches, technical workshops, and intense competition. With a focus on three key themes, this event promises to be a battle of wits, creativity, and innovation.So gather your tools, prepare for an exhilarating ride, and get ready to make history at hackbangalore!',
              location: 'Bangalore',
              timeLeft: '6 hours',
              hostedBy: 'AngelHack',
              fundsNeeded: 10000,
              fundsRaised: 5000)
        ]);

  addFunds(Fund fundOption) {
    state = [...state, fundOption];
  }
}

final fundsProvider =
    StateNotifierProvider<FundsNotifier, List<Fund>>((ref) => FundsNotifier());
