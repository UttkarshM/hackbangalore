import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chosenProvider = StateProvider<bool>((ref) => false);
//false == Donation
//true == Fundraiser
