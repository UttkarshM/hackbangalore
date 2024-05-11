import 'package:flutter/material.dart';

class RaiseFund {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final String timeLeft;
  final double fundsRaised;
  final double fundsNeeded;

  const RaiseFund(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.location,
      required this.timeLeft,
      required this.fundsNeeded,
      required this.fundsRaised});
}
