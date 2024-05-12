import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyFund {
  final XFile? image;
  final String title;
  final String description;
  final String location;
  final String timeLeft;
  final String hostedBy;
  final double fundsRaised;
  final double fundsNeeded;

  const MyFund(
      {required this.image,
      required this.title,
      required this.description,
      required this.location,
      required this.timeLeft,
      required this.hostedBy,
      required this.fundsNeeded,
      required this.fundsRaised});
}
