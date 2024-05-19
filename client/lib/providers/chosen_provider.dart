import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chosenProvider = StateProvider<bool>((ref) => true);
//false == Donation
//true == Fundraiser
