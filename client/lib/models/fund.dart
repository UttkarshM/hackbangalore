import 'package:flutter/material.dart';

class Fund {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final String timeLeft;
  final String hostedBy;
  final double fundsRaised;
  final double fundsNeeded;

  const Fund(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.location,
      required this.timeLeft,
      required this.hostedBy,
      required this.fundsNeeded,
      required this.fundsRaised});
}
